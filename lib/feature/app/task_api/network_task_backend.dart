import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../common/internal/dio_logger_interceptor.dart';
import '../../../common/internal/dio_token_interceptor.dart';
import '../models/response/list_response.dart';
import '../models/response/task_response.dart';
import '../models/task.dart';
import 'task_api.dart';

class NetworkTaskBackend implements TaskApi {
  late Dio _client;

  NetworkTaskBackend() {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://beta.mrdekk.ru/todobackend',
    ));
    dio.interceptors.add(DioTokenInterceptor());
    dio.interceptors.add(DioLoggerInterceptor());
    _client = dio;
  }

  @override
  Future<Task> createTask({required Task task, int? revision}) async {
    final response = await _client.post(
      '/list',
      data: {
        "element": task.toJson(),
      },
      options: Options(
        headers: {'X-Last-Known-Revision': revision},
      ),
    );
    log('NETWORK CREATE TASK');
    return TaskResponse.fromJson(response.data).element;
  }

  @override
  Future<List<Task>> getList() async {
    final response = await _client.get('/list');
    return ListResponse.fromJson(response.data).list;
  }

  Future<ListResponse> getRevision() async {
    final response = await _client.get('/list');
    log('NETWORK GET LIST');
    return ListResponse.fromJson(response.data);
  }

  @override
  Future<List<Task>> updateList(
      {required List<Task> taskList, int? revision}) async {
    final response = await _client.patch(
      '/list',
      data: {"list": taskList.map((e) => e.toJson()).toList()},
      options: Options(
        headers: {'X-Last-Known-Revision': revision!},
      ),
    );
    log('NETWORK UPDATE LIST');
    return ListResponse.fromJson(response.data).list;
  }

  @override
  Future<Task> editTask({required Task task, int? revision}) async {
    final response = await _client.put(
      '/list/${task.id}',
      data: {
        "element": task.toJson(),
      },
      options: Options(
        headers: {'X-Last-Known-Revision': revision},
      ),
    );
    log('NETWORK EDIT TASK');
    return TaskResponse.fromJson(response.data).element;
  }

  @override
  Future<Task> deleteTask({int? revision, required String id}) async {
    log(id);
    final response = await _client.delete(
      '/list/$id',
      options: Options(
        headers: {'X-Last-Known-Revision': revision},
      ),
    );
    log('NETWORK DELETE TASK');
    return TaskResponse.fromJson(response.data).element;
  }

  @override
  Future<Task> getTask({int? revision, required String id}) async {
    final response = await _client.get(
      '/list/$id',
      options: Options(
        headers: {'X-Last-Known-Revision': revision},
      ),
    );
    return TaskResponse.fromJson(response.data).element;
  }
}
