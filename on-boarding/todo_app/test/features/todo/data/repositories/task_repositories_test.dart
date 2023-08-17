import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app/core/error/exception.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/network/network_info.dart';
import 'package:todo_app/features/todo/data/datasources/task_local_data_source.dart';
import 'package:todo_app/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:todo_app/features/todo/data/models/task_model.dart';
import 'package:todo_app/features/todo/data/repositories/task_repositories_impl.dart';

import 'task_repositories_test.mocks.dart';

@GenerateMocks([TaskLocalDataSource,TaskRemoteDataSource,NetworkInfo])
void main(){

  late TaskRepositoryImpl repository;

  late MockTaskRemoteDataSource mockRemoteDataSource;
  late MockTaskLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;


  setUp(() {

    mockLocalDataSource = MockTaskLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockTaskRemoteDataSource();

    repository = TaskRepositoryImpl(
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      remoteDataSource:mockRemoteDataSource,
    );

  });

     
    const  tId = 1;
    final tTaskModel = TaskModel(id: tId, title: 'first task',
     description: 'this is the first task', 
     dueDate: DateTime.now(), 
     isCompleted: false
     );

     final tTask = tTaskModel;

   test('should check if the device is online', () async {
    // assuming we get the id from a remote source for practicing purposes

    // arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

    // act
    repository.getTask(tId);

    // assert
    verify(mockNetworkInfo.isConnected);
  });
 group('device is online', () {
      // This setUp applies only to the 'device is online' group
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTask(tId))
              .thenAnswer((_) async => tTaskModel);
          // act
          final result = await repository.getTask(tId);
          // assert
          verify(mockRemoteDataSource.getTask(tId));
          expect(result, equals(Right(tTask)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTask(tId))
              .thenAnswer((_) async => tTaskModel);
          // act
          await repository.getTask(tId);
          // assert
          verify(mockRemoteDataSource.getTask(tId));
          verify(mockLocalDataSource.cacheTask(tTaskModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTask(tId))
              .thenThrow(ServerException());
          // act
          final result = await repository.getTask(tId);
          // assert
          verify(mockRemoteDataSource.getTask(tId));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(ServerFailure(message: ''))));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });
  
}

