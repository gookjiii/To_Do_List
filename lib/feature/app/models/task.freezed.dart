// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get text => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get done => throw _privateConstructorUsedError;
  @HiveField(3)
  Priority get importance => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get deadline => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  @HiveField(6)
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "changed_at")
  @HiveField(7)
  int? get changedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "last_updated_by")
  @HiveField(8)
  String? get lastUpdatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String text,
      @HiveField(2) bool done,
      @HiveField(3) Priority importance,
      @HiveField(4) int? deadline,
      @HiveField(5) String? color,
      @JsonKey(name: "created_at") @HiveField(6) int? createdAt,
      @JsonKey(name: "changed_at") @HiveField(7) int? changedAt,
      @JsonKey(name: "last_updated_by") @HiveField(8) String? lastUpdatedBy});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? done = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Priority,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as int?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      changedAt: changedAt == freezed
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedBy: lastUpdatedBy == freezed
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String text,
      @HiveField(2) bool done,
      @HiveField(3) Priority importance,
      @HiveField(4) int? deadline,
      @HiveField(5) String? color,
      @JsonKey(name: "created_at") @HiveField(6) int? createdAt,
      @JsonKey(name: "changed_at") @HiveField(7) int? changedAt,
      @JsonKey(name: "last_updated_by") @HiveField(8) String? lastUpdatedBy});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? done = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_$_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Priority,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as int?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      changedAt: changedAt == freezed
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdatedBy: lastUpdatedBy == freezed
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'TaskAdapter')
class _$_Task implements _Task {
  const _$_Task(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.text,
      @HiveField(2) required this.done,
      @HiveField(3) required this.importance,
      @HiveField(4) this.deadline,
      @HiveField(5) this.color,
      @JsonKey(name: "created_at") @HiveField(6) this.createdAt,
      @JsonKey(name: "changed_at") @HiveField(7) this.changedAt,
      @JsonKey(name: "last_updated_by") @HiveField(8) this.lastUpdatedBy});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String text;
  @override
  @HiveField(2)
  final bool done;
  @override
  @HiveField(3)
  final Priority importance;
  @override
  @HiveField(4)
  final int? deadline;
  @override
  @HiveField(5)
  final String? color;
  @override
  @JsonKey(name: "created_at")
  @HiveField(6)
  final int? createdAt;
  @override
  @JsonKey(name: "changed_at")
  @HiveField(7)
  final int? changedAt;
  @override
  @JsonKey(name: "last_updated_by")
  @HiveField(8)
  final String? lastUpdatedBy;

  @override
  String toString() {
    return 'Task(id: $id, text: $text, done: $done, importance: $importance, deadline: $deadline, color: $color, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.done, done) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.changedAt, changedAt) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedBy, lastUpdatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(done),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(changedAt),
      const DeepCollectionEquality().hash(lastUpdatedBy));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {@HiveField(0)
          required final String id,
      @HiveField(1)
          required final String text,
      @HiveField(2)
          required final bool done,
      @HiveField(3)
          required final Priority importance,
      @HiveField(4)
          final int? deadline,
      @HiveField(5)
          final String? color,
      @JsonKey(name: "created_at")
      @HiveField(6)
          final int? createdAt,
      @JsonKey(name: "changed_at")
      @HiveField(7)
          final int? changedAt,
      @JsonKey(name: "last_updated_by")
      @HiveField(8)
          final String? lastUpdatedBy}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get text;
  @override
  @HiveField(2)
  bool get done;
  @override
  @HiveField(3)
  Priority get importance;
  @override
  @HiveField(4)
  int? get deadline;
  @override
  @HiveField(5)
  String? get color;
  @override
  @JsonKey(name: "created_at")
  @HiveField(6)
  int? get createdAt;
  @override
  @JsonKey(name: "changed_at")
  @HiveField(7)
  int? get changedAt;
  @override
  @JsonKey(name: "last_updated_by")
  @HiveField(8)
  String? get lastUpdatedBy;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
