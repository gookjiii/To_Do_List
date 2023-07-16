// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tasklist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) delete,
    required TResult Function(Task task) edit,
    required TResult Function(String text, Priority? importance, int? deadline)
        create,
    required TResult Function() getList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteTaskEvent value) delete,
    required TResult Function(EditTaskEvent value) edit,
    required TResult Function(CreateTaskEvent value) create,
    required TResult Function(GetListEvent value) getList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListEventCopyWith<$Res> {
  factory $TaskListEventCopyWith(
          TaskListEvent value, $Res Function(TaskListEvent) then) =
      _$TaskListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TaskListEventCopyWithImpl<$Res>
    implements $TaskListEventCopyWith<$Res> {
  _$TaskListEventCopyWithImpl(this._value, this._then);

  final TaskListEvent _value;
  // ignore: unused_field
  final $Res Function(TaskListEvent) _then;
}

/// @nodoc
abstract class _$$DeleteTaskEventCopyWith<$Res> {
  factory _$$DeleteTaskEventCopyWith(
          _$DeleteTaskEvent value, $Res Function(_$DeleteTaskEvent) then) =
      __$$DeleteTaskEventCopyWithImpl<$Res>;
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$DeleteTaskEventCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res>
    implements _$$DeleteTaskEventCopyWith<$Res> {
  __$$DeleteTaskEventCopyWithImpl(
      _$DeleteTaskEvent _value, $Res Function(_$DeleteTaskEvent) _then)
      : super(_value, (v) => _then(v as _$DeleteTaskEvent));

  @override
  _$DeleteTaskEvent get _value => super._value as _$DeleteTaskEvent;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$DeleteTaskEvent(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$DeleteTaskEvent implements DeleteTaskEvent {
  const _$DeleteTaskEvent({required this.task});

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskListEvent.delete(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTaskEvent &&
            const DeepCollectionEquality().equals(other.task, task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(task));

  @JsonKey(ignore: true)
  @override
  _$$DeleteTaskEventCopyWith<_$DeleteTaskEvent> get copyWith =>
      __$$DeleteTaskEventCopyWithImpl<_$DeleteTaskEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) delete,
    required TResult Function(Task task) edit,
    required TResult Function(String text, Priority? importance, int? deadline)
        create,
    required TResult Function() getList,
  }) {
    return delete(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
  }) {
    return delete?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteTaskEvent value) delete,
    required TResult Function(EditTaskEvent value) edit,
    required TResult Function(CreateTaskEvent value) create,
    required TResult Function(GetListEvent value) getList,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class DeleteTaskEvent implements TaskListEvent {
  const factory DeleteTaskEvent({required final Task task}) = _$DeleteTaskEvent;

  Task get task;
  @JsonKey(ignore: true)
  _$$DeleteTaskEventCopyWith<_$DeleteTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditTaskEventCopyWith<$Res> {
  factory _$$EditTaskEventCopyWith(
          _$EditTaskEvent value, $Res Function(_$EditTaskEvent) then) =
      __$$EditTaskEventCopyWithImpl<$Res>;
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$EditTaskEventCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res>
    implements _$$EditTaskEventCopyWith<$Res> {
  __$$EditTaskEventCopyWithImpl(
      _$EditTaskEvent _value, $Res Function(_$EditTaskEvent) _then)
      : super(_value, (v) => _then(v as _$EditTaskEvent));

  @override
  _$EditTaskEvent get _value => super._value as _$EditTaskEvent;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$EditTaskEvent(
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$EditTaskEvent implements EditTaskEvent {
  const _$EditTaskEvent({required this.task});

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskListEvent.edit(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditTaskEvent &&
            const DeepCollectionEquality().equals(other.task, task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(task));

  @JsonKey(ignore: true)
  @override
  _$$EditTaskEventCopyWith<_$EditTaskEvent> get copyWith =>
      __$$EditTaskEventCopyWithImpl<_$EditTaskEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) delete,
    required TResult Function(Task task) edit,
    required TResult Function(String text, Priority? importance, int? deadline)
        create,
    required TResult Function() getList,
  }) {
    return edit(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
  }) {
    return edit?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteTaskEvent value) delete,
    required TResult Function(EditTaskEvent value) edit,
    required TResult Function(CreateTaskEvent value) create,
    required TResult Function(GetListEvent value) getList,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class EditTaskEvent implements TaskListEvent {
  const factory EditTaskEvent({required final Task task}) = _$EditTaskEvent;

  Task get task;
  @JsonKey(ignore: true)
  _$$EditTaskEventCopyWith<_$EditTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTaskEventCopyWith<$Res> {
  factory _$$CreateTaskEventCopyWith(
          _$CreateTaskEvent value, $Res Function(_$CreateTaskEvent) then) =
      __$$CreateTaskEventCopyWithImpl<$Res>;
  $Res call({String text, Priority? importance, int? deadline});
}

/// @nodoc
class __$$CreateTaskEventCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res>
    implements _$$CreateTaskEventCopyWith<$Res> {
  __$$CreateTaskEventCopyWithImpl(
      _$CreateTaskEvent _value, $Res Function(_$CreateTaskEvent) _then)
      : super(_value, (v) => _then(v as _$CreateTaskEvent));

  @override
  _$CreateTaskEvent get _value => super._value as _$CreateTaskEvent;

  @override
  $Res call({
    Object? text = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_$CreateTaskEvent(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Priority?,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CreateTaskEvent implements CreateTaskEvent {
  const _$CreateTaskEvent(this.text, {this.importance, this.deadline});

  @override
  final String text;
  @override
  final Priority? importance;
  @override
  final int? deadline;

  @override
  String toString() {
    return 'TaskListEvent.create(text: $text, importance: $importance, deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaskEvent &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.deadline, deadline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(deadline));

  @JsonKey(ignore: true)
  @override
  _$$CreateTaskEventCopyWith<_$CreateTaskEvent> get copyWith =>
      __$$CreateTaskEventCopyWithImpl<_$CreateTaskEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) delete,
    required TResult Function(Task task) edit,
    required TResult Function(String text, Priority? importance, int? deadline)
        create,
    required TResult Function() getList,
  }) {
    return create(text, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
  }) {
    return create?.call(text, importance, deadline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(text, importance, deadline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteTaskEvent value) delete,
    required TResult Function(EditTaskEvent value) edit,
    required TResult Function(CreateTaskEvent value) create,
    required TResult Function(GetListEvent value) getList,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateTaskEvent implements TaskListEvent {
  const factory CreateTaskEvent(final String text,
      {final Priority? importance, final int? deadline}) = _$CreateTaskEvent;

  String get text;
  Priority? get importance;
  int? get deadline;
  @JsonKey(ignore: true)
  _$$CreateTaskEventCopyWith<_$CreateTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetListEventCopyWith<$Res> {
  factory _$$GetListEventCopyWith(
          _$GetListEvent value, $Res Function(_$GetListEvent) then) =
      __$$GetListEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetListEventCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res>
    implements _$$GetListEventCopyWith<$Res> {
  __$$GetListEventCopyWithImpl(
      _$GetListEvent _value, $Res Function(_$GetListEvent) _then)
      : super(_value, (v) => _then(v as _$GetListEvent));

  @override
  _$GetListEvent get _value => super._value as _$GetListEvent;
}

/// @nodoc

class _$GetListEvent implements GetListEvent {
  const _$GetListEvent();

  @override
  String toString() {
    return 'TaskListEvent.getList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Task task) delete,
    required TResult Function(Task task) edit,
    required TResult Function(String text, Priority? importance, int? deadline)
        create,
    required TResult Function() getList,
  }) {
    return getList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
  }) {
    return getList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Task task)? delete,
    TResult Function(Task task)? edit,
    TResult Function(String text, Priority? importance, int? deadline)? create,
    TResult Function()? getList,
    required TResult orElse(),
  }) {
    if (getList != null) {
      return getList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteTaskEvent value) delete,
    required TResult Function(EditTaskEvent value) edit,
    required TResult Function(CreateTaskEvent value) create,
    required TResult Function(GetListEvent value) getList,
  }) {
    return getList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
  }) {
    return getList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteTaskEvent value)? delete,
    TResult Function(EditTaskEvent value)? edit,
    TResult Function(CreateTaskEvent value)? create,
    TResult Function(GetListEvent value)? getList,
    required TResult orElse(),
  }) {
    if (getList != null) {
      return getList(this);
    }
    return orElse();
  }
}

abstract class GetListEvent implements TaskListEvent {
  const factory GetListEvent() = _$GetListEvent;
}

/// @nodoc
mixin _$TaskListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> tasks)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> tasks)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoadedState value) loaded,
    required TResult Function(TaskListLoadingState value) loading,
    required TResult Function(TaskListErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListLoadedState value)? loaded,
    TResult Function(TaskListLoadingState value)? loading,
    TResult Function(TaskListErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoadedState value)? loaded,
    TResult Function(TaskListLoadingState value)? loading,
    TResult Function(TaskListErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListStateCopyWith<$Res> {
  factory $TaskListStateCopyWith(
          TaskListState value, $Res Function(TaskListState) then) =
      _$TaskListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TaskListStateCopyWithImpl<$Res>
    implements $TaskListStateCopyWith<$Res> {
  _$TaskListStateCopyWithImpl(this._value, this._then);

  final TaskListState _value;
  // ignore: unused_field
  final $Res Function(TaskListState) _then;
}

/// @nodoc
abstract class _$$TaskListLoadedStateCopyWith<$Res> {
  factory _$$TaskListLoadedStateCopyWith(_$TaskListLoadedState value,
          $Res Function(_$TaskListLoadedState) then) =
      __$$TaskListLoadedStateCopyWithImpl<$Res>;
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$TaskListLoadedStateCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res>
    implements _$$TaskListLoadedStateCopyWith<$Res> {
  __$$TaskListLoadedStateCopyWithImpl(
      _$TaskListLoadedState _value, $Res Function(_$TaskListLoadedState) _then)
      : super(_value, (v) => _then(v as _$TaskListLoadedState));

  @override
  _$TaskListLoadedState get _value => super._value as _$TaskListLoadedState;

  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_$TaskListLoadedState(
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$TaskListLoadedState implements TaskListLoadedState {
  const _$TaskListLoadedState({required final List<Task> tasks})
      : _tasks = tasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskListState.loaded(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListLoadedState &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  _$$TaskListLoadedStateCopyWith<_$TaskListLoadedState> get copyWith =>
      __$$TaskListLoadedStateCopyWithImpl<_$TaskListLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loaded(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> tasks)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> tasks)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoadedState value) loaded,
    required TResult Function(TaskListLoadingState value) loading,
    required TResult Function(TaskListErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListLoadedState value)? loaded,
    TResult Function(TaskListLoadingState value)? loading,
    TResult Function(TaskListErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoadedState value)? loaded,
    TResult Function(TaskListLoadingState value)? loading,
    TResult Function(TaskListErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TaskListLoadedState implements TaskListState {
  const factory TaskListLoadedState({required final List<Task> tasks}) =
      _$TaskListLoadedState;

  List<Task> get tasks;
  @JsonKey(ignore: true)
  _$$TaskListLoadedStateCopyWith<_$TaskListLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskListLoadingStateCopyWith<$Res> {
  factory _$$TaskListLoadingStateCopyWith(_$TaskListLoadingState value,
          $Res Function(_$TaskListLoadingState) then) =
      __$$TaskListLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskListLoadingStateCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res>
    implements _$$TaskListLoadingStateCopyWith<$Res> {
  __$$TaskListLoadingStateCopyWithImpl(_$TaskListLoadingState _value,
      $Res Function(_$TaskListLoadingState) _then)
      : super(_value, (v) => _then(v as _$TaskListLoadingState));

  @override
  _$TaskListLoadingState get _value => super._value as _$TaskListLoadingState;
}

/// @nodoc

class _$TaskListLoadingState implements TaskListLoadingState {
  const _$TaskListLoadingState();

  @override
  String toString() {
    return 'TaskListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskListLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> tasks)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> tasks)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoadedState value) loaded,
    required TResult Function(TaskListLoadingState value) loading,
    required TResult Function(TaskListErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListLoadedState value)? loaded,
    TResult Function(TaskListLoadingState value)? loading,
    TResult Function(TaskListErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoadedState value)? loaded,
    TResult Function(TaskListLoadingState value)? loading,
    TResult Function(TaskListErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TaskListLoadingState implements TaskListState {
  const factory TaskListLoadingState() = _$TaskListLoadingState;
}

/// @nodoc
abstract class _$$TaskListErrorStateCopyWith<$Res> {
  factory _$$TaskListErrorStateCopyWith(_$TaskListErrorState value,
          $Res Function(_$TaskListErrorState) then) =
      __$$TaskListErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$TaskListErrorStateCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res>
    implements _$$TaskListErrorStateCopyWith<$Res> {
  __$$TaskListErrorStateCopyWithImpl(
      _$TaskListErrorState _value, $Res Function(_$TaskListErrorState) _then)
      : super(_value, (v) => _then(v as _$TaskListErrorState));

  @override
  _$TaskListErrorState get _value => super._value as _$TaskListErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$TaskListErrorState(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskListErrorState implements TaskListErrorState {
  const _$TaskListErrorState({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TaskListState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListErrorState &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$TaskListErrorStateCopyWith<_$TaskListErrorState> get copyWith =>
      __$$TaskListErrorStateCopyWithImpl<_$TaskListErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> tasks) loaded,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Task> tasks)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> tasks)? loaded,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoadedState value) loaded,
    required TResult Function(TaskListLoadingState value) loading,
    required TResult Function(TaskListErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TaskListLoadedState value)? loaded,
    TResult Function(TaskListLoadingState value)? loading,
    TResult Function(TaskListErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoadedState value)? loaded,
    TResult Function(TaskListLoadingState value)? loading,
    TResult Function(TaskListErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TaskListErrorState implements TaskListState {
  const factory TaskListErrorState({required final String message}) =
      _$TaskListErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$TaskListErrorStateCopyWith<_$TaskListErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
