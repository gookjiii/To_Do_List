part of 'tasklist_bloc.dart';
@freezed
class TaskListState with _$TaskListState{
  const factory TaskListState.loaded({required List<Task> tasks})=TaskListLoadedState;
  const factory TaskListState.loading()=TaskListLoadingState;
  const factory TaskListState.error({required String message})=TaskListErrorState;
}