// import 'package:done/feature/app/models/task.dart';
// import 'package:done/feature/main_page/task_list_screen.dart';
// import 'package:done/feature/task/task_edit_screen.dart';
// import 'package:flutter/material.dart';
//
//
// class AppRouter {
//   static const String mainScreen = '/mainscreen';
//   static const String taskScreen = '/taskscreen';
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final RoutersArgument arguments=settings.arguments as RoutersArgument;
//     switch (settings.name) {
//       case mainScreen:
//         return MaterialPageRoute(
//           builder: (_) => const TaskListScreen(navigatorCallback: ,),
//         );
//       case taskScreen:
//
//         return MaterialPageRoute(
//           builder: (_) =>  TaskEditScreen(
//             task: arguments.task,
//           ),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           ),
//         );
//     }
//   }
//
// }
// class RoutersArgument {
//   final Task? task;
//   RoutersArgument({this.task});
// }
