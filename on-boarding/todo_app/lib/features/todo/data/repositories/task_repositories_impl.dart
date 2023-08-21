import 'package:dartz/dartz.dart' hide Task;
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/features/todo/domain/entities/task.dart';
import 'package:todo_app/features/todo/domain/repositories/task_repository.dart';

import '../../../../core/network/network_info.dart';
import '../datasources/task_local_data_source.dart';
import '../datasources/task_remote_data_source.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl extends TaskRepository{
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
    required this.remoteDataSource,
  });




  @override
  Future<Either<Failure, Task>> createTask(Task task) async{
  try {
      await remoteDataSource.createTask(task as TaskModel);
      return Right(task);
    } catch (e) {
      return const Left(CacheFailure(message: 'Can not create task'));
    }  
    
  }

  @override
  Future<Either<Failure, void>> deleteTask(int id) async{
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteTask(id);
        return const Right(null);
      } catch (e) {
        return const Left(ServerFailure(message: ''));
      }
    } else {
      return const Left(NetworkFailure(message: ''));
    }
  }

  @override
  Future<Either<Failure, Task>> getTask(int id) async {
    
    if (await networkInfo.isConnected) {
      try {
        final remoteTask = await remoteDataSource.getTask(id);
        localDataSource.cacheTask(remoteTask);
        return Right(remoteTask);
      } catch (e) {
        return const Left(ServerFailure(message: ''));
      }
    } else {
      try {
        final localTask = await localDataSource.getTask(id);
        return Right(localTask);
      } catch (e) {
        return const Left(CacheFailure(message: ''));
      }
    }

  }

  @override
  Future<Either<Failure, List<Task>>> getTasks() async{
    
if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.getTasks();
        localDataSource.cacheTasks(remoteTasks);
        return Right(remoteTasks);
      } catch (e) {
        return const Left(ServerFailure(message: ''));
      }
    } else {
      try {
        final localTasks = await localDataSource.getTasks();
        return Right(localTasks);
      } catch (e) {
        return const Left(CacheFailure(message: ''));
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(Task task) async{
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateTask(task as TaskModel);
        return const Right(null);
      } catch (e) {
        return const Left(ServerFailure(message: ''));
      }
    } else {
      return const Left(NetworkFailure(message: ''));
    }
  }
  
}