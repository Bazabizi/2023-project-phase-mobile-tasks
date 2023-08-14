import 'package:todo_app/features/todo/data/models/task_model.dart';
abstract class TaskLocalDataSource{

  Future<TaskModel> getTask(int id);
  Future<List<TaskModel>> getTasks();
  Future<void> createTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(int id);

  void cacheTask(TaskModel remoteTask) {}

  void cacheTasks(List<TaskModel> remoteTasks) {}


}