import '../models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> getTask(int id);
  Future<List<TaskModel>> getTasks();
  Future<void> createTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(int id);

}