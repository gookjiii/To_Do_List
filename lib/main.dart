import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'common/logger.dart';
import 'feature/app/models/priority.dart';
import 'feature/app/models/task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLogger();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(PriorityAdapter());
  await Hive.openBox<Task>('tasks');
  runApp(
    const App(
      isDebug: false,
    ),
  );
}
