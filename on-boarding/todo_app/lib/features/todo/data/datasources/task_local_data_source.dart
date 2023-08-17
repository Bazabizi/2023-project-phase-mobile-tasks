
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

  Future<void> cacheTask(TaskModel remoteTask);

  Future<void> cacheTasks(List<TaskModel> remoteTasks);


}

const CACHED_TASK = 'CACHED_TASK';
const CACHED_LAST_ID = 'CACHED_LAST_ID';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {

  final SharedPreferences sharedPreferences;
  TaskLocalDataSourceImpl({required this.sharedPreferences});
  
  
  Future<void> addToSharedPref(List<TaskModel> tasks) async {
    final updatedTaskJsonList = tasks.map((task) => task.toJson()).toList();

    final updatedJsonString = json.encode(updatedTaskJsonList);
    await sharedPreferences.setString(CACHED_TASK, updatedJsonString);

  }

  @override
  Future<void> createTask(TaskModel task) async{
    List<TaskModel> tasks = await getTasks();
    final int lastTaskId = tasks.isNotEmpty ? tasks.last.id : 0;
    final int newTaskId = lastTaskId + 1;

    final newTask = TaskModel(
      id: newTaskId,
      title: task.title,
      description:task.description ,
      dueDate: task.dueDate, 
      isCompleted: task.isCompleted);

    tasks.add(newTask);
    await addToSharedPref(tasks);
  }
  
  @override
  Future<void> deleteTask(int id) async{
    final tasks = await getTasks();
    tasks.removeWhere((task) => task.id == id);
    await addToSharedPref(tasks);
    
  }
  
  @override
  Future<TaskModel> getTask(int id) async{
    final tasks = await getTasks();
    final task = tasks.firstWhere((task) => task.id == id);
    return task;

  }
  
  @override
Future<List<TaskModel>> getTasks() async {
  final jsonString = sharedPreferences.getString(CACHED_TASK);
  final List<dynamic> jsonList = json.decode(jsonString!) as List<dynamic>;
  final List<TaskModel> tasks = jsonList
      .map((taskJson) => TaskModel.fromJson(taskJson))
      .toList(); // Convert to List<TaskModel>
  return tasks;
}

  @override
  Future<void> updateTask(TaskModel task) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((t) => t.id == task.id);

    if (index != -1) {
      tasks[index] = task;
      await addToSharedPref(tasks);
    } else {
      throw CacheException();
    }
  }
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
  

  

}