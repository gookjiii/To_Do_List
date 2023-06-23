import 'package:flutter/material.dart';
import 'package:todo_backend/src/pages/add_edit_task_screen.dart';
import 'package:todo_backend/src/pages/home_page.dart';

abstract class Routes {
  static const String home = '/';
  static const String add_edit = '/add_edit';

  static final Map<String, Widget Function(BuildContext)> routes = {
    home: (_) => const HomePage(),
    add_edit: (context) => AddEditTaskScreen(
        idx: ModalRoute.of(context)?.settings.arguments as int?)
  };
}

abstract class NavMan {
  static final key = GlobalKey<NavigatorState>();

  static NavigatorState get _nav => key.currentState!;

  static Future<dynamic> openAddEditPage([int? taskIndex]) =>
      _nav.pushNamed(Routes.add_edit, arguments: taskIndex);

  static void pop() => _nav.pop();
}
