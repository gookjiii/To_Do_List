import 'package:ToDoList/feature/app/models/priority.dart';
import 'package:ToDoList/feature/app/models/task.dart';
import 'package:ToDoList/feature/app/repositories/task_connect_repository.dart';
import 'package:ToDoList/feature/main_page/bloc/tasklist_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTaskRepository extends Mock implements TaskConnectRepository {}

void main() {
  final tasklist = [
    const Task(
        id: '1',
        text: 'task1',
        done: false,
        createdAt: 10000,
        changedAt: 15000,
        importance: Priority.basic,
        lastUpdatedBy: 'android'),
    const Task(
        id: '2',
        text: 'task2',
        done: true,
        createdAt: 10000,
        changedAt: 15000,
        importance: Priority.low,
        lastUpdatedBy: 'android'),
    const Task(
        id: '3',
        text: 'task3',
        done: true,
        createdAt: 10000,
        changedAt: 15000,
        importance: Priority.basic,
        lastUpdatedBy: 'android'),
    const Task(
        id: '4',
        text: 'task4',
        done: false,
        createdAt: 14330,
        changedAt: 151400,
        importance: Priority.important,
        lastUpdatedBy: 'android'),
    const Task(
        id: '5',
        text: 'task5',
        done: false,
        createdAt: 12300,
        changedAt: 175400,
        importance: Priority.important,
        lastUpdatedBy: 'android'),
  ];

  final testTask = tasklist[0];
  late TaskListBloc bloc;
  late MockTaskRepository api;
  group('TaskListBloc', () {
    setUp(() {
      api = MockTaskRepository();
      bloc = TaskListBloc(taskRepository: api);
    });
    TaskListBloc blocBuild() {
      return TaskListBloc(taskRepository: api);
    }

    group('getList', () {
      test(
          'on GetListEvent emits TaskListLoadingState and TaskListLoadedState ',
          () {
        when(api.getList()).thenAnswer((_) async => tasklist);
        bloc.add(const GetListEvent());
        expectLater(
          bloc.stream,
          emitsInOrder(
            [
              equals(const TaskListLoadingState()),
              equals(TaskListLoadedState(tasks: tasklist))
            ],
          ),
        );
      });
    });
    group('DeleteTaskEvent', () {
      blocTest<TaskListBloc, TaskListState>(
        'emits TaskListErrorState when unsuccessful',
        setUp: () {},
        build: blocBuild,
        seed: () => TaskListLoadedState(tasks: tasklist),
        act: (bloc) {
          bloc.add(DeleteTaskEvent(task: testTask));
        },
        expect: () => [
          const TaskListErrorState(message: 'error'),
        ],
      );
      blocTest<TaskListBloc, TaskListState>(
        'emits TaskListLoaded when successful',
        setUp: () {},
        build: blocBuild,
      );
    });
  });
}
