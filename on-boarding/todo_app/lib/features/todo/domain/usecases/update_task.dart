import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTask extends UseCase<void , UpdateParams>{
  final TaskRepository repository;

  UpdateTask({required this.repository});

  @override
  Future<Either<Failure, void>> call(UpdateParams params ) async {
    return await repository.updateTask(params.task);
  }
  
}

class UpdateParams extends Equatable{
  final Task task;
  
  const UpdateParams({
    required this.task,
  });  

  @override
  List<Object?> get props => [task];
}