import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/features/todo/domain/entities/task.dart';

import 'package:todo_app/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app/features/todo/domain/usecases/view_all_tasks.dart';
import 'create_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late ViewAllTasks usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = ViewAllTasks(repository:mockTaskRepository);
  });
  final tasks = [
    Task(
      id: 1,
      title: 'task1',
      description: 'description1',
      dueDate: DateTime.now(),
    ),
    Task(
      id: 2,
      title: 'task2',
      description: 'description2',
      dueDate: DateTime.now(),
    ),
  ];
  test(
    'should display all tasks from the repository',
    () async {
      when(mockTaskRepository.getTasks())
          .thenAnswer((_) async => Right(tasks));
      
      final result = await usecase(NoParams());

      expect(result, Right(tasks));
      verify(mockTaskRepository.getTasks());
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
