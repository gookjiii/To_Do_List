// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListResponse _$ListResponseFromJson(Map<String, dynamic> json) {
  return _ListResponse.fromJson(json);
}

/// @nodoc
mixin _$ListResponse {
  int get revision => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<Task> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListResponseCopyWith<ListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListResponseCopyWith<$Res> {
  factory $ListResponseCopyWith(
          ListResponse value, $Res Function(ListResponse) then) =
      _$ListResponseCopyWithImpl<$Res>;
  $Res call({int revision, String status, List<Task> list});
}

/// @nodoc
class _$ListResponseCopyWithImpl<$Res> implements $ListResponseCopyWith<$Res> {
  _$ListResponseCopyWithImpl(this._value, this._then);

  final ListResponse _value;
  // ignore: unused_field
  final $Res Function(ListResponse) _then;

  @override
  $Res call({
    Object? revision = freezed,
    Object? status = freezed,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
abstract class _$$_ListResponseCopyWith<$Res>
    implements $ListResponseCopyWith<$Res> {
  factory _$$_ListResponseCopyWith(
          _$_ListResponse value, $Res Function(_$_ListResponse) then) =
      __$$_ListResponseCopyWithImpl<$Res>;
  @override
  $Res call({int revision, String status, List<Task> list});
}

/// @nodoc
class __$$_ListResponseCopyWithImpl<$Res>
    extends _$ListResponseCopyWithImpl<$Res>
    implements _$$_ListResponseCopyWith<$Res> {
  __$$_ListResponseCopyWithImpl(
      _$_ListResponse _value, $Res Function(_$_ListResponse) _then)
      : super(_value, (v) => _then(v as _$_ListResponse));

  @override
  _$_ListResponse get _value => super._value as _$_ListResponse;

  @override
  $Res call({
    Object? revision = freezed,
    Object? status = freezed,
    Object? list = freezed,
  }) {
    return _then(_$_ListResponse(
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListResponse implements _ListResponse {
  const _$_ListResponse(
      {required this.revision,
      required this.status,
      required final List<Task> list})
      : _list = list;

  factory _$_ListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListResponseFromJson(json);

  @override
  final int revision;
  @override
  final String status;
  final List<Task> _list;
  @override
  List<Task> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'ListResponse(revision: $revision, status: $status, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListResponse &&
            const DeepCollectionEquality().equals(other.revision, revision) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(revision),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  _$$_ListResponseCopyWith<_$_ListResponse> get copyWith =>
      __$$_ListResponseCopyWithImpl<_$_ListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListResponseToJson(
      this,
    );
  }
}

abstract class _ListResponse implements ListResponse {
  const factory _ListResponse(
      {required final int revision,
      required final String status,
      required final List<Task> list}) = _$_ListResponse;

  factory _ListResponse.fromJson(Map<String, dynamic> json) =
      _$_ListResponse.fromJson;

  @override
  int get revision;
  @override
  String get status;
  @override
  List<Task> get list;
  @override
  @JsonKey(ignore: true)
  _$$_ListResponseCopyWith<_$_ListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
