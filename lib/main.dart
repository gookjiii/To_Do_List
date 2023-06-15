import 'dart:async';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'database/dbmanager.dart';
import 'src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TodoDatabase database = TodoDatabase();
  await database.loadTasks();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    EasyDynamicThemeWidget(
      child: App(prefs: prefs),
    ),
  );
}
