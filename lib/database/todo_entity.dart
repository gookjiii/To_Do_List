import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

enum ImportanceType { no, low, high }

class TodoEntity extends Equatable {
  int id;
  String description;
  bool completed;
  ImportanceType important;
  DateTime? deadline;
  bool deadlineExistance;

  TodoEntity({
    this.id = 0,
    this.description = '',
    this.completed = false,
    this.important = ImportanceType.no,
    this.deadline,
    this.deadlineExistance = false,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String description = json['description'];
    bool done = json['done'];
    ImportanceType importance = importanceFromString(json['importance']);
    DateTime? deadline =
        json['deadline'] != null ? DateTime.parse(json['deadline']) : null;
    bool hasDeadline = json['hasDeadline'];
    return TodoEntity(
      id: id,
      description: description,
      completed: done,
      important: importance,
      deadline: deadline,
      deadlineExistance: hasDeadline,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': description.hashCode +
          completed.hashCode +
          important.hashCode +
          deadline.hashCode,
      'description': description,
      'done': completed,
      'importance': importanceToString(important),
      'deadline': deadline?.toIso8601String(),
      'hasDeadline': deadlineExistance,
    };
  }

  @override
  List<Object> get props =>
      [id, description, completed, important, deadline ?? 'none'];
}

String importanceToString(ImportanceType importance) {
  switch (importance) {
    case ImportanceType.low:
      return 'low';
    case ImportanceType.high:
      return 'high';
    default:
      return 'no';
  }
}

ImportanceType importanceFromString(String value) {
  switch (value) {
    case 'low':
      return ImportanceType.low;
    case 'high':
      return ImportanceType.high;
    default:
      return ImportanceType.no;
  }
}

extension DateToText on DateTime {
  String get date {
    var formatter = DateFormat('d MMMM yyyy');
    return formatter.format(this);
  }
}
