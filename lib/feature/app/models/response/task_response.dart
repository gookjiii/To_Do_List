import 'package:freezed_annotation/freezed_annotation.dart';

import '../task.dart';


part 'task_response.freezed.dart';

part 'task_response.g.dart';

@freezed
class TaskResponse with _$TaskResponse {
  const factory TaskResponse({
    required int revision,
    required String status,
    required Task element,
  }) = _TaskResponse;

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);
}
