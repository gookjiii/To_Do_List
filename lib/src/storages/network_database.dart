import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/retry.dart';

import '../common/logger.dart';
import '../models/task.dart';
import '../storages/database.dart';

class NetworkException implements Exception {
  int statusCode;
  String? message;

  NetworkException(this.statusCode, [this.message]);

  bool get isUnsync => statusCode == 400;

  @override
  String toString() {
    if (message != null) {
      return 'NetworkException [$statusCode]: $message';
    }

    if (statusCode == 400) return 'NetworkException [400]: Bad request';
    if (statusCode == 401) return 'NetworkException [401]: Unauthorized';
    if (statusCode == 404) return 'NetworkException [404]: Not found';
    if (statusCode == 500) return 'NetworkException [500]: Server error';

    return 'NetworkException [$statusCode]';
  }
}

typedef JsonObject = Map<String, dynamic>;

final class NetworkDatabase implements Storage {
  static const baseUrl = 'https://beta.mrdekk.ru/todobackend';
  static const _token = 'bypasses';

  static int? failsThreshold;

  static final NetworkDatabase _instance = NetworkDatabase._();

  NetworkDatabase._();

  factory NetworkDatabase() => _instance;

  int _revision = -1;

  @override
  int get revision => _revision;

  final _client = RetryClient(
    Client(),
    when: (BaseResponse response) => response.statusCode == 500,
  );

  JsonObject _handleResponse(Response response) {
    if (response.statusCode == 200) {
      final JsonObject body = jsonDecode(response.body);

      if (body['status'] != 'ok') {
        throw NetworkException(200, 'Unknown status: ${body['status']}');
      }

      _revision = body['revision'];

      return body;
    }

    final e = NetworkException(response.statusCode);
    Logger.net(e.toString());
    throw e;
  }

  Future<JsonObject> _send(
    String method,
    String path, [
    JsonObject? body,
  ]) async {
    final request = Request(method, Uri.parse('$baseUrl/$path'));

    // Headers
    request.headers['Authorization'] = 'Bearer $_token';
    if (_revision != -1) {
      request.headers['X-Last-Known-Revision'] = _revision.toString();
    }
    if (failsThreshold != null) {
      request.headers['X-Generate-Fails'] = failsThreshold!.toString();
    }

    // Body
    if (body != null) {
      request.body = jsonEncode(body);
      request.headers['Content-Type'] = 'application/json';
    }

    // Send
    final response = await Response.fromStream(await _client.send(request));
    return _handleResponse(response);
  }

  @override
  Future<List<Task>> getTasks() async {
    final data = await _send('GET', 'list');
    final List<dynamic> list = data['list'];

    return Future.value(
      list.map<Task>((item) => Task.fromJson(item)).toList(),
    );
  }

  @override
  Future<void> setTasks(List<Task> tasks) async {
    await _send('PATCH', 'list', {
      'list': tasks.map((item) => item.toJson()).toList(),
    });
  }

  @override
  Future<Task> getTask(String id) async {
    final data = await _send('GET', 'list/$id');
    final element = data['element'];

    return Future.value(Task.fromJson(element));
  }

  @override
  Future<void> addTask(Task task) async {
    await _send('POST', 'list', {'element': task.toJson()});
  }

  @override
  Future<void> updateTask(Task task) async {
    await _send('PUT', 'list/${task.id}', {'element': task.toJson()});
  }

  @override
  Future<void> deleteTask(String id) async {
    await _send('DELETE', 'list/$id');
  }
}
