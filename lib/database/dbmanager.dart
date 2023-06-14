import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'todo_entity.dart';

class TodoDatabase {
  static final _database = TodoDatabase._internal();

  final logger = Logger();

  final List<TodoEntity> _tasks = [];
  final List<TodoEntity> _uncompletedTasks = [];
  int _completed = 0;

  factory TodoDatabase() {
    return _database;
  }

  TodoDatabase._internal();

  void addTask(TodoEntity task) {
    _tasks.add(task);
    _uncompletedTasks.add(task);
    _saveTasks();
  }

  void removeTask(TodoEntity task) {
    _tasks.remove(task);
    if (_uncompletedTasks.contains(task)) {
      _uncompletedTasks.remove(task);
    }

    _completed = _tasks.length - _uncompletedTasks.length;

    _saveTasks();
  }

  void modifyTask(
    TodoEntity task, {
    int? id,
    String? description,
    bool? completed,
    ImportanceType? important,
    DateTime? deadline,
  }) {
    if (completed != null) {
      if (completed && !task.completed) {
        uncompletedTasks.remove(task);
      } else if (!completed && task.completed) {
        uncompletedTasks.add(task);
      }
    }
    _completed = _tasks.length - _uncompletedTasks.length;
    task.id = id ?? task.id;
    task.description = description ?? task.description;
    task.completed = completed ?? task.completed;
    task.important = important ?? task.important;
    task.deadline = deadline ?? task.deadline;
    _saveTasks();
  }

  List<TodoEntity> get tasks {
    return _tasks;
  }

  List<TodoEntity> get uncompletedTasks {
    return _uncompletedTasks;
  }

  int get completed {
    return _completed;
  }

  Future<void> loadTasks() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tasksJson = prefs.getString('tasks');
      if (tasksJson != null) {
        var taskData = jsonDecode(tasksJson) as List;
        for (var e in taskData) {
          TodoEntity task = TodoEntity.fromJson(e);
          _tasks.add(task);
          if (task.completed) {
          } else {
            _uncompletedTasks.add(task);
          }
        }
      }
    } catch (e) {
      logger.e("Error while reading file: $e");
    }
  }

  Future<void> _saveTasks() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Map<String, dynamic>> tasksData =
          _tasks.map((e) => e.toJson()).toList();
      String tasksJson = jsonEncode(tasksData);
      await prefs.setString('tasks', tasksJson);
    } catch (e) {
      logger.e('Failed to save tasks: $e');
    }
  }
}
