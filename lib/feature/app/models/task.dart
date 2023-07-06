// ignore_for_file: invalid_annotation_target

import 'package:ToDoList/feature/app/models/priority.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';

part 'task.g.dart';

@freezed
class Task with _$Task {
  @HiveType(typeId: 0, adapterName: 'TaskAdapter')
  const factory Task({
    @HiveField(0) required String id,
    @HiveField(1) required String text,
    @HiveField(2) required bool done,
    @HiveField(3) required Priority importance,
    @HiveField(4) int? deadline,
    @HiveField(5) String? color,
    @JsonKey(name: "created_at") @HiveField(6) int? createdAt,
    @JsonKey(name: "changed_at") @HiveField(7) int? changedAt,
    @JsonKey(name: "last_updated_by") @HiveField(8) String? lastUpdatedBy,
  }) = _Task;

  factory Task.initial() => Task(
        id: const Uuid().v1(),
        text: '',
        done: false,
        importance: Priority.basic,
      );

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
