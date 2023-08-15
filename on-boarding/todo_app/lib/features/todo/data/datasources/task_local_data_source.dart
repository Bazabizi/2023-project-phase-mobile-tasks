
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';

import '../../../../core/error/exception.dart';
abstract class TaskLocalDataSource{

  Future<TaskModel> getTask(int id);
  Future<List<TaskModel>> getTasks();
  Future<void> createTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(int id);
  Future<TaskModel> getLastTask();

  Future<void> cacheTask(TaskModel remoteTask);

  Future<void> cacheTasks(List<TaskModel> remoteTasks);


}

const CACHED_TASK = 'CACHED_TASK';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {

  final SharedPreferences sharedPreferences;
  TaskLocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<void> cacheTask(TaskModel taskToCache) {
    return sharedPreferences.setString(
    CACHED_TASK,
    json.encode(taskToCache.toJson()),
  );
  }
  
  @override
  Future<void> cacheTasks(List<TaskModel> remoteTasks) {
    // TODO: implement cacheTasks
    throw UnimplementedError();
  }
  
  @override
  Future<void> createTask(TaskModel task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTask(int id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
  
  @override
  Future<TaskModel> getTask(int id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }
  
  @override
  Future<List<TaskModel>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  
  @override
  Future<TaskModel> getLastTask() {
    final jsonString = sharedPreferences.getString(CACHED_TASK);
    if (jsonString != null) {
      return Future.value(TaskModel.fromJson(json.decode(jsonString)));
    } 
    else {
      throw CacheException();
    }
  }

}