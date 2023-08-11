// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_app/main.dart';
import 'package:todo_app/routes.dart';
import 'package:todo_app/features/todo/presentation/screens/onboarding.dart';
import 'package:todo_app/features/todo/presentation/screens/todo_list.dart';

void main() {

  testWidgets('onboarding screen will go to to-do list screen when button clicked', 
      (tester) async {
    
    await tester.pumpWidget(const MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      home: Onboarding()
    ));

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.byType(TodoList), findsOneWidget);
  });


}