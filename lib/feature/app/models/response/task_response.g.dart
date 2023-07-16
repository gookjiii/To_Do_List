// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskResponse _$$_TaskResponseFromJson(Map<String, dynamic> json) =>
    _$_TaskResponse(
      revision: json['revision'] as int,
      status: json['status'] as String,
      element: Task.fromJson(json['element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TaskResponseToJson(_$_TaskResponse instance) =>
    <String, dynamic>{
      'revision': instance.revision,
      'status': instance.status,
      'element': instance.element,
    };
