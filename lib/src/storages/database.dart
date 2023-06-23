import '../models/task.dart';

abstract interface class Storage {
  int get revision;

  Future<List<Task>> getTasks();

  Future<void> setTasks(List<Task> tasks);

  Future<Task> getTask(String id);

  Future<void> addTask(Task task);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(String id);
}
