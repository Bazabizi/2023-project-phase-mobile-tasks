import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';

class ViewTask extends UseCase<Task , Params>{
  final TaskRepository repository;
  ViewTask({required this.repository});

  @override
  Future<Either<Failure , Task>> call(Params params ) async {
    return await repository.getTask(params.id);
  }
}

class Params extends Equatable{
  final int id;
  
  const Params({
    required this.id,
  });  

  @override
  List<Object?> get props => [id];
}