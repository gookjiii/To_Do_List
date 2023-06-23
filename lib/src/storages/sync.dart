import '../common/logger.dart';
import '../models/task.dart';
import 'local_database.dart';
import 'network_database.dart';

import '../storages/database.dart';

final class SyncStorage implements Storage {
  static final SyncStorage _instance = SyncStorage._();

  SyncStorage._();

  factory SyncStorage() => _instance;

  final LocalDatabase _localStorage = LocalDatabase();
  final NetworkDatabase _netStorage = NetworkDatabase();

  late int _revision;

  @override
  int get revision => _revision;

  Future<void> init() async {
    await _localStorage.init();
  }

  Future<void> _pushTasks() async {
    if (_netStorage.revision == _localStorage.revision) return;

    Logger.storage('Push tasks');

    // Костыль?
    // если ни разу не получали revision
    // то по умолчанию он равен -1, и тогда будем получать 400
    if (_netStorage.revision == -1) {
      // TODO: NetStorage.revision = -1
      try {
        await _netStorage.getTasks();
      } catch (_) {
        Logger.storage('bebebe');
        Logger.storage('Failed to push tasks');
        return;
      }
    }

    final localTasks = await _localStorage.getTasks();
    try {
      await _netStorage.setTasks(localTasks);
      await _localStorage.setRevision(_netStorage.revision);
    } catch (_) {
      Logger.storage('Failed to push tasks');
    }
  }

  Future<T> _doOper<T>(
    Future<T> Function() netOper,
    Future<T> Function() localOper,
  ) async {
    bool netSuccess = false;
    T? netResult;

    try {
      netResult = await netOper();
      netSuccess = true;
    } on NetworkException catch (e) {
      if (e.isUnsync) {
        await _pushTasks();

        try {
          netResult = await netOper();
          netSuccess = true;
        } catch (_) {}
      }
    } catch (_) {}

    T localResult = await localOper();

    if (!netSuccess) {
      Logger.storage('Failed to perform operation with sync');
    } else {
      // нужно ли?
      _pushTasks(); // TODO: Maybe excess _pushTasks()
    }

    return netResult ?? localResult;
  }

  @override
  Future<List<Task>> getTasks() async {
    Logger.storage('Get tasks');

    final List<Task> netTasks;
    try {
      netTasks = await _netStorage.getTasks();
    } catch (_) {
      Logger.storage('Failed to get tasks from net');
      return await _localStorage.getTasks();
    }

    if (_netStorage.revision == _localStorage.revision) return netTasks;

    Logger.storage('Unsynchronized data');
    Logger.storage(
      'Revision before sync: net ${_netStorage.revision} <-> local ${_localStorage.revision}',
    );

    final List<Task> result;

    final localTasks = await _localStorage.getTasks();

    if (_netStorage.revision < _localStorage.revision) {
      Logger.storage('Sync: storage -> net');
      try {
        await _netStorage.setTasks(localTasks);
        result = localTasks;
      } catch (_) {
        Logger.storage('Failed to sync');
        return localTasks;
      }
    } else {
      Logger.storage('Sync: net -> storage');
      await _localStorage.setTasks(netTasks);
      result = netTasks;
    }

    await _localStorage.setRevision(_netStorage.revision);

    Logger.storage(
      'Revision after sync: net ${_netStorage.revision} <-> local ${_localStorage.revision}',
    );

    return result;
  }

  @override
  Future<void> setTasks(List<Task> tasks) async {
    Logger.storage('Set tasks, count: ${tasks.length}');
    await _doOper(
      () => _netStorage.setTasks(tasks),
      () => _localStorage.setTasks(tasks),
    );
  }

  @override
  Future<Task> getTask(String id) async {
    Logger.storage('Get task: $id');
    return await _netStorage.getTask(id); // no sync for now
  }

  @override
  Future<void> addTask(Task task) async {
    Logger.storage('Add task: ${task.id}');
    await _doOper(
      () => _netStorage.addTask(task),
      () => _localStorage.addTask(task),
    );
  }

  @override
  Future<void> updateTask(Task task) async {
    Logger.storage('Update task: ${task.id}');
    await _doOper(
      () => _netStorage.updateTask(task),
      () => _localStorage.updateTask(task),
    );
  }

  @override
  Future<void> deleteTask(String id) async {
    Logger.storage('Delete task: $id');
    await _doOper(
      () => _netStorage.deleteTask(id),
      () => _localStorage.deleteTask(id),
    );
  }
}
