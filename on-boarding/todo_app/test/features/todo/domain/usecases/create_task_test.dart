import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app/features/todo/domain/entities/task.dart';

import 'package:todo_app/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app/features/todo/domain/usecases/create_task.dart';
import 'create_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late CreateTask usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = CreateTask(repository:mockTaskRepository);
  });

  final task = Task(
    id: 1,
    title : 'first Task',
    description : 'this is the first task',
    dueDate : DateTime.now(),
  );

  test(
    'should add task from the repository',
    () async {
      when(mockTaskRepository.createTask(task))
          .thenAnswer((_) async => const Right(null));
      
      final result = await usecase(Params(task: task));
      // assert
      expect(result, Right(null));
      verify(mockTaskRepository.createTask(task));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
