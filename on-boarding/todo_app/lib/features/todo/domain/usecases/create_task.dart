import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class CreateTask extends UseCase<void, Params> {
  final TaskRepository repository;

  CreateTask({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(Params params) async{
    return await (repository.createTask(params.task));
    
  }

  
}


class Params extends Equatable{
  final Task task;
  
  const Params({
    required this.task,
  });  

  @override
  List<Object?> get props => [task];
}