import 'package:flutter/material.dart';
import 'package:todo_app/todo/Model/Task.dart';
import 'package:todo_app/todo/presentation/screens/addTask.dart';
import 'package:todo_app/todo/presentation/screens/task_detail.dart';
import 'package:todo_app/todo/presentation/screens/todo_list.dart';
import 'package:todo_app/todo/presentation/screens/onboarding.dart';

class Routes {
  static const String onboarding = '/';
  static const String taskDetail = '/taskDetail';
  static const String addTask = '/addTask';
  static const String todoList = '/todoList';
  List<Task> tasks = [];
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => Onboarding());
      case taskDetail:
        final task = settings.arguments as Task;
        return MaterialPageRoute(builder: (_) => TaskDetail(task: task));
      case addTask:
        return MaterialPageRoute(builder: (_) => AddTask());
      case todoList:
        // final tasks = settings.arguments as List<Task>;
        return MaterialPageRoute(builder: (_) => TodoList());
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}