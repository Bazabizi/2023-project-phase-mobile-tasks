import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/domain/usecases/view_all_tasks.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/update_task.dart';
import '../../domain/usecases/view_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  CreateTask createTask;
  DeleteTask deleteTask;
  UpdateTask updateTask;
  ViewAllTasks viewAllTasks;
  ViewTask viewTask;
  
  TaskBloc(
      {
      required this.createTask,
      required this.deleteTask,
      required this.updateTask,
      required this.viewAllTasks,
      required this.viewTask,
      }
  ) : super(InitialState()) {
    on<LoadAllTasksEvent>((event, emit) {
      emit(LoadingState());

      viewAllTasks(NoParams()).then((value) => value.fold(
        (failure) => emit(ErrorState(message: failure.message)),
        (tasks) => emit(LoadedAllTaskState(tasks: tasks)),
      ));
    });

    on<CreateTaskEvent>((event, emit) {
      emit(LoadingState());
 
      createTask(CreateParams(task: event.task)).then((value) => value.fold(
        (failure) => emit(ErrorState(message: failure.message)),
        (task) => emit(CreateTaskState(task: event.task)),
      ));

      
      
      
    });

    on<UpdateTaskEvent>((event, emit) {
      emit(LoadingState());

      updateTask(UpdateParams(task:event.task)).then((value)=>value.fold(
        (failure) => emit(ErrorState(message: failure.message)) ,
        (task) => emit(UpdateTaskState(task: event.task)),
      ));
      
    });


    on<DeleteTaskEvent>((event , emit) {
      emit(LoadingState());

      deleteTask(DeleteParams(id:event.task.id)).then((value)=>value.fold(
        (failure) => emit(ErrorState(message: failure.message)) ,
        (task) => emit(UpdateTaskState(task: event.task)),
      ));
    });

    on<GetSingleTaskEvent>((event , emit){
      emit(LoadingState());

      viewTask(ViewParams(id: event.id)).then((value)=>value.fold(
      (failure) => emit(ErrorState(message: failure.message)),
      (task) => emit(LoadedSingleTaskState(task: task)),

      ));


    });

  }



}
