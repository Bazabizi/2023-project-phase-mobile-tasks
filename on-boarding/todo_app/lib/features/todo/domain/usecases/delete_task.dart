import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/task_repository.dart';

class DeleteTask extends UseCase<void , DeleteParams> {
  final TaskRepository repository;

  DeleteTask({required this.repository});

  @override
  Future<Either<Failure, void>> call(DeleteParams params ) async {
    return await repository.deleteTask(params.id);
  }
  
}

class DeleteParams extends Equatable{
  final int id;
  
  const DeleteParams({
    required this.id,
  });  

  @override
  List<Object?> get props => [id];
}