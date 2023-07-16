// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListResponse _$$_ListResponseFromJson(Map<String, dynamic> json) =>
    _$_ListResponse(
      revision: json['revision'] as int,
      status: json['status'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListResponseToJson(_$_ListResponse instance) =>
    <String, dynamic>{
      'revision': instance.revision,
      'status': instance.status,
      'list': instance.list,
    };
