import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do_app/screens/add_edit_task_screen.dart';
import 'package:to_do_app/screens/todo_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/colors.dart';
import '../database/todo_entity.dart';

class App extends StatelessWidget {
  const App({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('ru')],
      // initialRoute: HomeScreen.id,
      debugShowCheckedModeBanner: false,
      title: 'ToDoList App',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 32, height: 38 / 32),
          titleMedium: TextStyle(fontSize: 20, height: 32 / 20),
          labelLarge: TextStyle(fontSize: 14, height: 24 / 14),
          bodyMedium: TextStyle(
              fontSize: 14, height: 20 / 16, fontWeight: FontWeight.w400),
          titleSmall: TextStyle(fontSize: 14, height: 20 / 14),
        ),
        scaffoldBackgroundColor: AppColorsLightTheme.backPrimary,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColorsLightTheme.blue,
          foregroundColor: AppColorsLightTheme.white,
        ),
        cardColor: AppColorsLightTheme.backSecondary,
        appBarTheme: const AppBarTheme(color: AppColorsLightTheme.backPrimary),
        primaryColor: AppColorsLightTheme.primary,
      ),
      initialRoute: TodoListPage.id,
      routes: {
        TodoListPage.id: (_) => TodoListPage(prefs: prefs),
        AddEditTaskScreen.id: (_) =>
            AddEditTaskScreen(todo: TodoEntity(), newTask: true),
      },
    );
  }
}
