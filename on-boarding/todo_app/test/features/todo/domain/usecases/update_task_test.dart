import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app/features/todo/domain/entities/task.dart';

import 'package:todo_app/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app/features/todo/domain/usecases/update_task.dart';
import 'create_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late UpdateTask usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = UpdateTask(repository:mockTaskRepository);
  });
  final task = Task(
    id: 1,
    title : 'first Task',
    description : 'this is the first task',
    dueDate : DateTime.now(),
  );

  test(
    'should update task from the repository',
    () async {
      when(mockTaskRepository.updateTask(task))
          .thenAnswer((_) async => const Right(null));
      
      final result = await usecase(Params(task: task));

      expect(result, const Right(null));
      verify(mockTaskRepository.updateTask(task));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
