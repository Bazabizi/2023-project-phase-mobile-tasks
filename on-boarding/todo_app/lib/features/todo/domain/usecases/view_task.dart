import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';

class ViewTask extends UseCase<Task , ViewParams>{
  final TaskRepository repository;
  ViewTask({required this.repository});

  @override
  Future<Either<Failure , Task>> call(ViewParams params ) async {
    return await repository.getTask(params.id);
  }
}

class ViewParams extends Equatable{
  final int id;
  
  const ViewParams({
    required this.id,
  });  

  @override
  List<Object?> get props => [id];
}