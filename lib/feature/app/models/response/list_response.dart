import 'package:freezed_annotation/freezed_annotation.dart';

import '../task.dart';


part 'list_response.freezed.dart';

part 'list_response.g.dart';

@freezed
class ListResponse with _$ListResponse {
  const factory ListResponse({
    required int revision,
    required String status,
    required List<Task> list,
  }) = _ListResponse;

  factory ListResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResponseFromJson(json);
}
