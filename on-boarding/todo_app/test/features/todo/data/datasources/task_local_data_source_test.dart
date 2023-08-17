import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/error/exception.dart';
import 'package:todo_app/features/todo/data/datasources/task_local_data_source.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import './task_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late TaskLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;
  const CACHED_TASK = 'CACHED_TASK';


  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = TaskLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getTasks', () {
    final tTaskModelList = [
      TaskModel(
          id: 1,
          title: 'Test Task',
          description: 'Test Description',
          dueDate: DateTime.now(),
          isCompleted: false),
      TaskModel(
          id: 2,
          title: 'Test Task 2',
          description: 'Test Description 2',
          dueDate: DateTime.now(),
          isCompleted: false),
    ];

    test(
      'should return List<TaskModel> from SharedPreferences when there is one in the cache',
      () async {
        // arrange
    final updatedTaskJsonList = tTaskModelList.map((task) => task.toJson()).toList();

        when(mockSharedPreferences.getString(any))
            .thenReturn(json.encode(updatedTaskJsonList));
        // act
        final result = await dataSource.getTasks();
        // assert
        verify(mockSharedPreferences.getString(CACHED_TASK));
        expect(result, equals(tTaskModelList));
      },
    );

    
  });

  group('createTask', () {
    final tTaskModelList = [
      TaskModel(
          id: 1,
          title: 'Test Task',
          description: 'Test Description',
          dueDate: DateTime.now(),
          isCompleted: false),
      TaskModel(
          id: 2,
          title: 'Test Task 2',
          description: 'Test Description 2',
          dueDate: DateTime.now(),
          isCompleted: false),
    ];

    test(
      'should return List<TaskModel> from SharedPreferences when there is one in the cache',
      () async {
        // arrange
    final updatedTaskJsonList = tTaskModelList.map((task) => task.toJson()).toList();

        when(mockSharedPreferences.getString(any))
            .thenReturn(json.encode(updatedTaskJsonList));
        // act
        final result = await dataSource.getTasks();
        // assert
        verify(mockSharedPreferences.getString(CACHED_TASK));
        expect(result, equals(tTaskModelList));
      },
    );

    
  });

  group('deleteTask', () {
    final tTaskModelList = [
      TaskModel(
          id: 1,
          title: 'Test Task',
          description: 'Test Description',
          dueDate: DateTime.now(),
          isCompleted: false),
      TaskModel(
          id: 2,
          title: 'Test Task 2',
          description: 'Test Description 2',
          dueDate: DateTime.now(),
          isCompleted: false),
    ];

    test(
      'should return List<TaskModel> from SharedPreferences when there is one in the cache',
      () async {
        // arrange
    final updatedTaskJsonList = tTaskModelList.map((task) => task.toJson()).toList();

        when(mockSharedPreferences.getString(any))
            .thenReturn(json.encode(updatedTaskJsonList));
        // act
        final result = await dataSource.getTasks();
        // assert
        verify(mockSharedPreferences.getString(CACHED_TASK));
        expect(result, equals(tTaskModelList));
      },
    );

    
  });

  group('getTask', () {
    final tTaskModelList = [
      TaskModel(
          id: 1,
          title: 'Test Task',
          description: 'Test Description',
          dueDate: DateTime.now(),
          isCompleted: false),
      TaskModel(
          id: 2,
          title: 'Test Task 2',
          description: 'Test Description 2',
          dueDate: DateTime.now(),
          isCompleted: false),
    ];

    test(
      'should return List<TaskModel> from SharedPreferences when there is one in the cache',
      () async {
        // arrange
    final updatedTaskJsonList = tTaskModelList.map((task) => task.toJson()).toList();

        when(mockSharedPreferences.getString(any))
            .thenReturn(json.encode(updatedTaskJsonList));
        // act
        final result = await dataSource.getTasks();
        // assert
        verify(mockSharedPreferences.getString(CACHED_TASK));
        expect(result, equals(tTaskModelList));
      },
    );

    
  });
}