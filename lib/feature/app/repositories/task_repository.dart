import '../models/task.dart';

abstract class TaskRepository {
  Future<Task> createTask({required Task task});

  Future<List<Task>> getList();

  Future<Task> editTask({required Task task});

  Future<Task> deleteTask({required String id});

  Future<Task> getTask({required String id});
}
