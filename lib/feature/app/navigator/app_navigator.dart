import 'package:ToDoList/feature/app/navigator/navigation_information_parser.dart';
import 'package:rxdart/rxdart.dart';

import '../models/task.dart';
import 'navigation_delegate.dart';

class AppNavigator {
  final NavigationDelegate navigationDelegate;

  final NavigationInformationParser routeInforamtionParser;

  AppNavigator({
    required Task? task,
    required BehaviorSubject<List<Task>> tasksStream,
  })  : navigationDelegate = NavigationDelegate(
          task: task,
          tasksStream: tasksStream,
          isFirst: true,
        ),
        routeInforamtionParser = NavigationInformationParser();
}
