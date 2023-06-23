import 'dart:io';
import 'dart:ui';

import 'package:uuid/uuid.dart';

import '../common/utils.dart';

enum ImportanceType { none, low, high }

class Task {
  static const _uuid = Uuid();

  String id;
  String text;
  ImportanceType importance;
  DateTime? date;
  bool isDone;
  Color? color;
  DateTime createdAt;
  DateTime changedAt;
  String updatedBy;

  Task({
    String? id,
    required this.text,
    this.importance = ImportanceType.none,
    this.date,
    this.isDone = false,
    this.color,
    DateTime? createdAt,
  })  : id = id ?? _uuid.v4(),
        createdAt = createdAt ?? DateTime.now(),
        changedAt = createdAt ?? DateTime.now(),
        updatedBy = Platform.isAndroid ? 'android' : 'not android';

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        importance = importanceFromString(json['importance']),
        date = json.containsKey('deadline')
            ? timeStampToDateTime(json['deadline'])
            : null,
        isDone = json['done'],
        color = json.containsKey('color')
            ? Color(
                int.parse(
                  (json['color'] as String).substring(1),
                  radix: 16,
                ),
              )
            : null,
        createdAt = timeStampToDateTime(json['created_at']),
        changedAt = timeStampToDateTime(json['changed_at']),
        updatedBy = json['last_updated_by'];

  Map<String, Object> toJson() => {
        'id': id,
        'text': text,
        'importance': importanceToString(importance),
        if (date != null) 'deadline': dateTimeToTimeStamp(date!),
        'done': isDone,
        if (color != null) 'color': '#${color!.value.toRadixString(16)}',
        'created_at': dateTimeToTimeStamp(createdAt),
        'changed_at': dateTimeToTimeStamp(changedAt),
        'last_updated_by': updatedBy
      };

  @override
  String toString() {
    return '${text.length > 30 ? text.substring(0, 30) : text} [${isDone ? 'done' : 'not done'}]';
  }
}
