import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app/features/todo/domain/entities/task.dart';

import 'package:todo_app/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app/features/todo/domain/usecases/view_task.dart';
import 'create_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late ViewTask usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = ViewTask(repository:mockTaskRepository);
  });

  const int id = 1;
  final task = Task(
    id: 1,
    title : 'first Task',
    description : 'this is the first task',
    dueDate : DateTime.now(),
  );
  

  test(
    'should add task from the repository',
    () async {
      when(mockTaskRepository.getTask(any))
          .thenAnswer((_) async =>  Right(task));
      
      final result = await usecase(const Params(id: id));
      // assert
      expect(result, Right(task));
      verify(mockTaskRepository.getTask(id));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
