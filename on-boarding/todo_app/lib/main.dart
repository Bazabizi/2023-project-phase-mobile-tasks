import 'package:flutter/material.dart';
import 'package:todo_app/routes.dart';
import 'package:todo_app/todo/presentation/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
       onGenerateRoute: Routes.generateRoute,
      home:const Onboarding(),
    );
  }
}

