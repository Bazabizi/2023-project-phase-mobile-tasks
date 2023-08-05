import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/navigation.dart';
import '../widgets/task_list.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left:20.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          SizedBox(height: 20,),
          Navigation(title: 'Todo List',),
          Image(
            image: AssetImage('assets/images/todo_list.png',
            ),
            width: 300,
            height: 200,
          ),
          Text(
            'Tasks list',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              fontFamily: 'popins',
            ),
          ),
          SizedBox(height: 10,),
          TaskList(
            taskName: 'UI/UX App Design',
            date: '12/12/2021',
            color: Colors.red,
          ),

          SizedBox(height: 10,),
          TaskList(
            taskName: 'UI/UX App Design',
            date: '12/12/2021',
            color: Colors.blue,
          ),

          SizedBox(height: 10,),
          TaskList(
            taskName: 'View candidates',
            date: '12/12/2021',
            color: Colors.green,
          ),
          SizedBox(height: 10,),
          TaskList(
            taskName: 'Football Cu Drybling',
            date: '12/12/2021',
            color: Colors.yellow,
          ),
          SizedBox(height: 40,),
          Button(
          label: 'Create Task',),
          
          ],
        ),
      ),
      );
    
  }
}