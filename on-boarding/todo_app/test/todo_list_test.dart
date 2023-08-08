import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/routes.dart';
import 'package:todo_app/todo/presentation/screens/addTask.dart';
import 'package:todo_app/todo/presentation/widgets/button_todo.dart';
import 'package:todo_app/todo/presentation/widgets/task_list.dart';

void main(){

  group('todo list screen  display test', () { 
    testWidgets('To-do list will have two tasks after adding two tasks', 
      (tester) async {
    
    await tester.pumpWidget(MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      home: AddTask()));

    
    final inputFields = tester.widgetList(find.byType(TextField)).toList();
    
    //first task
    await tester.enterText(find.byWidget(inputFields[0]), 'Task 1');
    await tester.enterText(find.byWidget(inputFields[1]), "2023-12-12");     
    await tester.enterText(find.byWidget(inputFields[2]), 'fisrt description');
    
    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();


    //Go back to the addtask screen    
    await tester.tap(find.byType(Button));
    await tester.pumpAndSettle();

    expect(find.byType(AddTask), findsOneWidget);

    
    final secondInputFields = tester.widgetList(find.byType(TextField)).toList();

    //second task    
    await tester.enterText(find.byWidget(secondInputFields[0]), 'Task 2');
    await tester.enterText(find.byWidget(secondInputFields[1]), "2023-11-11");    
    await tester.enterText(find.byWidget(secondInputFields[2]), 'second description');
    
    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();


    expect(find.byType(TaskList), findsNWidgets(2));

    final taskListWidgets = tester.widgetList(find.byType(TaskList)).toList();
      

    // Verify that the last TaskList widget represents the last added task
    final lastTaskList = taskListWidgets.last as TaskList;
    final lastTaskName = lastTaskList.taskName;

    expect(lastTaskName, 'Task 2');
  
    });


  });


}