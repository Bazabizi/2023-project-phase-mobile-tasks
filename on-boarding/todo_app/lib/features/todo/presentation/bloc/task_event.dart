part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadAllTasksEvent extends TaskEvent {}
class GetSingleTaskEvent extends TaskEvent {
  final int id;
  const GetSingleTaskEvent({
    required this.id,
  });
}

class CreateTaskEvent extends TaskEvent {
  final Task task;

  const CreateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}
class UpdateTaskEvent extends TaskEvent {
  final Task task;

  const UpdateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}
class DeleteTaskEvent extends TaskEvent {
  final Task task;

  const DeleteTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}
