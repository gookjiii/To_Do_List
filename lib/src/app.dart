import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do_app/screens/add_edit_task_screen.dart';
import 'package:to_do_app/screens/todo_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/todo_entity.dart';

class App extends StatelessWidget {
  const App({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en'), const Locale('ru')],
      // initialRoute: HomeScreen.id,
      debugShowCheckedModeBanner: false,
      title: 'ToDoList App',
      initialRoute: TodoListPage.id,
      routes: {
        TodoListPage.id: (_) => TodoListPage(prefs: prefs),
        AddEditTaskScreen.id: (_) =>
            AddEditTaskScreen(todo: TodoEntity(), newTask: true),
      },
    );
  }
}
