import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/task_repository.dart';

class DeleteTask extends UseCase<void , Params> {
  final TaskRepository repository;

  DeleteTask({required this.repository});

  @override
  Future<Either<Failure, void>> call(Params params ) async {
    return await repository.deleteTask(params.id);
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