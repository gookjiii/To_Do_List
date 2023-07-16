import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../main_page/task_list_screen.dart';
import '../../task/task_edit_screen.dart';
import '../models/task.dart';
import 'navigator_state.dart';

class NavigationDelegate extends RouterDelegate<NavigatorConfigState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigatorConfigState> {
  Task? task;
  late bool isNew = true;
  late bool isFirst;

  final BehaviorSubject<List<Task>> tasksStream;

  NavigationDelegate({
    required this.task,
    required this.tasksStream,
    required this.isFirst,
  });

  void openList() {
    task = null;
    isNew = false;
    notifyListeners();
  }

  void createNewTask() {
    task = Task.initial();
    isNew = true;
    notifyListeners();
  }

  void editTask(Task task) {
    task = task;
    isNew = false;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) => route.didPop(result),
      pages: [
        if (isFirst)
          MaterialPage(
            child: TaskListScreen(
              navigatorCallback: (t) {
                task = t;
                isNew = false;
                notifyListeners();
              },
            ),
          ),
        if (task != null)
          MaterialPage(
            child: TaskEditScreen(
              task: task,
              isNew: isNew,
            ),
          ),
      ],
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey();

  @override
  Future<void> setNewRoutePath(NavigatorConfigState configuration) async {
    if (configuration is NavigatorTaskState) {
      if (configuration.id != null) {
        final tasks = tasksStream.value;
        try {
          task = tasks.firstWhere((element) => element.id == configuration.id);
          isNew = false;
        } catch (e) {
          task = Task.initial();
          isNew = true;
        }
      } else {
        task = Task.initial();
        isNew = true;
      }
    } else {
      task = null;
      isNew = true;
    }
    notifyListeners();
  }
}
