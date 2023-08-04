import 'package:add_task/feature/presentation/screens/addTask.dart';
import 'package:add_task/feature/presentation/widgets/customTextInput.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'todo app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
      debugShowCheckedModeBanner: false,
      
      home: const AddTask(),
    );
  }
}