import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/domain/entities/task.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTaskModel = TaskModel(
    id:1,
    title : 'first Task',
    description : 'this is the first task',
    dueDate : DateTime.now(),
    isCompleted : true,
  );

  test(
    'should be a subclass of Task entity',
    () async {
      // assert
      expect(tTaskModel, isA<Task>());
    },
  );
  
  test(
    'should return a valid model when the JSON number is an integer',
    () async {

      final Map<String, dynamic> jsonMap = json.decode(fixture('response.json'));
      
      final result = TaskModel.fromJson(jsonMap);
      
      expect(result, isA<TaskModel>());
    },
  );

  test(
    'should return a JSON map containing the proper data',
    () async {
      final result = tTaskModel.toJson();
      final expectedJsonMap = {
        "id": 1,
        "title": "first Task",
        "description": "this is the first task",
        "dueDate": tTaskModel.dueDate.toString(),
        "isCompleted": false, 
      };
      expect(result, expectedJsonMap);
    },
  );

}