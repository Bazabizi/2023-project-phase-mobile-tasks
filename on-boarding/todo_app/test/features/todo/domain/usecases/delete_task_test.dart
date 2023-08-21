import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:todo_app/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app/features/todo/domain/usecases/delete_task.dart';
import 'create_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late DeleteTask usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = DeleteTask(repository:mockTaskRepository);
  });
  const  id = 1;
  // final task = Task(
  //   id: 1,
  //   title : 'first Task',
  //   description : 'this is the first task',
  //   dueDate : DateTime.now(),
  //   isCompleted : false,
  // );

  test(
    'should delete task from the repository',
    () async {
      when(mockTaskRepository.deleteTask(id))
          .thenAnswer((_) async => const Right(null));
      
      final result = await usecase(const DeleteParams(id: id));

      expect(result, const Right(null));
      verify(mockTaskRepository.deleteTask(id));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
