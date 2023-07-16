// ignore_for_file: unused_import

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../app/models/priority.dart';
import '../../app/models/task.dart';
import '../../app/repositories/task_connect_repository.dart';

part 'tasklist_event.dart';

part 'tasklist_state.dart';

part 'tasklist_bloc.freezed.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  //final TaskLocalRepository _taskRepository;
  //final TaskNetworkRepository _taskRepository;
  final TaskConnectRepository _taskRepository;

  TaskListBloc({
    required TaskConnectRepository taskRepository,
  })  : _taskRepository = taskRepository,
        super(const TaskListState.loading()) {
    on<GetListEvent>(_onGetList);
    on<DeleteTaskEvent>(_onDelete);
    on<CreateTaskEvent>(_onCreate);
    on<EditTaskEvent>(_onEdit);
  }

  Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      const deviceType = 'ANDROID';
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      final deviceName = androidInfo.model;
      return '$deviceType $deviceName';
    } else if (Platform.isIOS) {
      const deviceType = 'IOS';
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      final deviceName = iosInfo.model;
      return '$deviceType $deviceName';
    }
  }

  Future<void> _onEdit(EditTaskEvent event, Emitter<TaskListState> emit) async {
    try {
      final task = event.task.copyWith(
        changedAt: DateTime.now().microsecondsSinceEpoch,
        lastUpdatedBy: await getDeviceInfo(),
      );
      if (state is TaskListLoadedState) {
        final currentState = state as TaskListLoadedState;
        final List<Task> newTasks = List.from(currentState.tasks);
        for (int i = 0; i < newTasks.length; i++) {
          if (newTasks[i].id == event.task.id) {
            newTasks[i] = task;
            break;
          }
        }
        emit(
          TaskListState.loaded(
            tasks: newTasks,
          ),
        );
        await _taskRepository.editTask(task: task);
      }
    } catch (e) {
      emit(TaskListState.error(message: e.toString()));
      rethrow;
    }
  }

  Future<void> _onCreate(
      CreateTaskEvent event, Emitter<TaskListState> emit) async {
    Task task = Task(
      id: const Uuid().v1(),
      text: event.text,
      done: false,
      importance: event.importance ?? Priority.basic,
      deadline: event.deadline,
      changedAt: DateTime.now().microsecondsSinceEpoch,
      createdAt: DateTime.now().microsecondsSinceEpoch,
      lastUpdatedBy: await getDeviceInfo(),
    );
    try {
      if (state is TaskListLoadedState) {
        final currentState = state as TaskListLoadedState;
        final List<Task> newTasks = List.from(currentState.tasks);
        newTasks.add(task);

        emit(
          TaskListState.loaded(
            tasks: newTasks,
          ),
        );
        await _taskRepository.createTask(task: task);
      }
    } catch (e) {
      emit(TaskListState.error(message: e.toString()));
    }
  }

  Future<void> _onDelete(
      DeleteTaskEvent event, Emitter<TaskListState> emit) async {
    try {
      if (state is TaskListLoadedState) {
        final currentState = state as TaskListLoadedState;
        final List<Task> newTasks = List.from(currentState.tasks);
        newTasks.remove(event.task);

        emit(
          TaskListState.loaded(
            tasks: newTasks,
          ),
        );
        await _taskRepository.deleteTask(id: event.task.id);
      }
    } catch (e) {
      emit(
        TaskListState.error(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _onGetList(
      GetListEvent event, Emitter<TaskListState> emit) async {
    emit(
      const TaskListState.loading(),
    );
    try {
      final response = await _taskRepository.getList();
      emit(
        TaskListState.loaded(tasks: response),
      );
    } catch (e) {
      emit(
        TaskListState.error(
          message: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
