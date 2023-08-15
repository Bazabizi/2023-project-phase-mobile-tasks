import 'package:http/http.dart' as http;
import '../models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> getTask(int id);
  Future<List<TaskModel>> getTasks();
  Future<void> createTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(int id);

}
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource{
  final http.Client client;

  TaskRemoteDataSourceImpl({required this.client});
  @override
  Future<void> createTask(TaskModel task) async {
}

  @override
  Future<void> deleteTask(int id) async {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getTask(int id) async{
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}