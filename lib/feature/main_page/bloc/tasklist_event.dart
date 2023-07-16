 part of 'tasklist_bloc.dart';
 @freezed
 class TaskListEvent with _$TaskListEvent{
   const factory TaskListEvent.delete({required Task task})=DeleteTaskEvent;
   const factory TaskListEvent.edit({required Task task})=EditTaskEvent;
   const factory TaskListEvent.create( String text, {Priority? importance,int? deadline})=CreateTaskEvent;
   const factory TaskListEvent.getList()=GetListEvent;
 }