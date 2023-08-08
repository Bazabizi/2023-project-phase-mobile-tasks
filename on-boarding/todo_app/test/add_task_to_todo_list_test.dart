import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/routes.dart';
import 'package:todo_app/todo/presentation/screens/addTask.dart';
import 'package:todo_app/todo/presentation/screens/todo_list.dart';
import 'package:todo_app/todo/presentation/widgets/task_list.dart';

void main(){
group('To-do screen test', () { 
    testWidgets('To-do list screen has no tasks initally', (tester) async {
      await tester.pumpWidget(MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        
        home: TodoList()));    
      expect(find.byType(TaskList), findsNothing);

      },
    );


    testWidgets('To-do list will have no tasks after inserting invalid input', (tester) async {
      await tester.pumpWidget(MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        
        home: AddTask()));

      //input invalid data
      final inputFields = tester.widgetList(find.byType(TextField)).toList();
      await tester.enterText(find.byWidget(inputFields[0]), 'Task 1');
      await tester.enterText(find.byWidget(inputFields[1]), 'Day 1'); // date format is wrong    
      await tester.enterText(find.byWidget(inputFields[2]), 'Description 1');
       
      await tester.tap(find.text('Add Task'));
      await tester.pumpAndSettle();

      expect(find.byType(TaskList), findsNothing);



    });

    testWidgets('To-do list will have one task after inserting valid input', (tester) async {
    
    await tester.pumpWidget(MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      
      home: AddTask()));

    
    final inputFields = tester.widgetList(find.byType(TextField)).toList();
    
    await tester.enterText(find.byWidget(inputFields[0]), 'Task 1');
    await tester.enterText(find.byWidget(inputFields[1]), "2023-12-12"); // date format is correct    
    await tester.enterText(find.byWidget(inputFields[2]), 'Description 1');
    
    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();
    
    expect(find.byType(TaskList), findsOneWidget);

  

    });

    

  });
}