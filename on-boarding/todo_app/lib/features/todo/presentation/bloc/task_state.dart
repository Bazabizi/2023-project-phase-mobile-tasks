part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();
  
  @override
  List<Object> get props => [];
}


final class InitialState extends TaskState {}

final class LoadingState extends TaskState {}

final class LoadedAllTaskState extends TaskState {
  final List<Task> tasks;

  const LoadedAllTaskState({required this.tasks});
  
  @override
  List<Object> get props => [tasks];
}

final class LoadedSingleTaskState extends TaskState {
  final Task task;

  const LoadedSingleTaskState({required this.task});
  
  @override
  List<Object> get props => [task];
}
final class ErrorState extends TaskState {
  final String message;

  const ErrorState({required this.message});
  
  @override
  List<Object> get props => [message];
}

final class CreateTaskState extends TaskState {
  final Task task;

  const CreateTaskState({required this.task});
  @override
  List<Object> get props => [task];
}
final class UpdateTaskState extends TaskState {
  final Task task;

  const UpdateTaskState({required this.task});
  
  @override
  List<Object> get props => [task];
}
final class DeleteTaskState extends TaskState {
  final Task task;

  const DeleteTaskState({required this.task});
  
  @override
  List<Object> get props => [task];
}