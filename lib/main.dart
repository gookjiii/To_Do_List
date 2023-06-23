import 'package:flutter/material.dart';
import 'package:todo_backend/src/common/colors.dart';
import 'package:todo_backend/src/common/logger.dart';
import 'package:todo_backend/src/common/navigator_manager.dart';
import 'package:todo_backend/src/common/task_manager.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TaskMan.init();
  await TaskMan.load();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      // theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      initialRoute: Routes.home,
      navigatorKey: NavMan.key,
      navigatorObservers: [NavigatorLogger()],
      routes: Routes.routes,
    );
  }
}
