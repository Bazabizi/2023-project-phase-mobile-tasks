import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class CreateTask extends UseCase<void, CreateParams> {
  final TaskRepository repository;

  CreateTask({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(CreateParams params) async{
    return await repository.createTask(params.task);
    
  }

  
}


class CreateParams extends Equatable{
  final Task task;
  
  const CreateParams({
    required this.task,
  });  

  @override
  List<Object?> get props => [task];
}