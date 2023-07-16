import 'package:ToDoList/feature/app/repositories/task_repository.dart';

import '../models/task.dart';
import '../task_api/local_storage_api.dart';

class TaskLocalRepository implements TaskRepository {
  TaskLocalRepository(this._localStorageApi);
  final LocalStorageApi _localStorageApi;

  @override
  Future<Task> createTask({required Task task}) async {
    return _localStorageApi.createTask(task: task);
  }

  @override
  Future<Task> deleteTask({required String id}) {
    return _localStorageApi.deleteTask(id: id);
  }

  @override
  Future<Task> editTask({required Task task}) {
    return _localStorageApi.editTask(task: task);
  }

  @override
  Future<List<Task>> getList() {
    return _localStorageApi.getList();
  }

  @override
  Future<Task> getTask({required String id}) {
    return _localStorageApi.getTask(id: id);
  }

  Future<List<Task>> updateList({required List<Task> taskList}) {
    return _localStorageApi.updateList(taskList: taskList);
  }
}
