import 'package:dartz/dartz.dart'hide Task;
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class ViewAllTasks extends UseCase<List<Task> , NoParams>{
  final TaskRepository repository;

  ViewAllTasks({required this.repository});

  @override
  Future<Either<Failure, List<Task>>> call(NoParams params ) async {
    return await repository.getTasks();
  }
  
}
