// ignore_for_file: unused_import

abstract class NavigatorConfigState {}

class NavigatorListState extends NavigatorConfigState {}

class NavigatorTaskState extends NavigatorConfigState {
  //final Task? task;
  final bool isNew;

  final String? id;

  NavigatorTaskState({required this.id, this.isNew = false});
}

// class NavigatorNewTaskState extends NavigatorConfigState {
//
// }
