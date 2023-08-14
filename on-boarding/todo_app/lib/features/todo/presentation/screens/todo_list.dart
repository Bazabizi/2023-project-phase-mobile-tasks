import 'package:flutter/material.dart';
import 'package:todo_app/routes.dart';

import '../../Model/Task.dart';
import '../../Model/TaskManager.dart';
import '../widgets/button_todo.dart';
import '../widgets/navigation.dart';
import '../widgets/task_list.dart';

class TodoList extends StatelessWidget {
  final List<Task>task = TaskManager.tasks;

  TodoList({
    Key?key,
    }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          const SizedBox(height: 20,),
           const Navigation(title: 'Todo List',),
          const Image(
            image: AssetImage('assets/images/todo_list.png',
            ),
            width: 300,
            height: 200,
          ),
          const Text(
            'Tasks list',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              fontFamily: 'popins',
            ),
          ),
          const SizedBox(height: 10,),
          
          if (task.isEmpty) 
            const Center(
              child: Text('No tasks yet'),) 
          
          else 
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: task.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            
                            onTap: () => Navigator.pushNamed(
                                context, Routes.taskDetail,
                                arguments: TaskManager.tasks[index]),
                            
                            child: Column(
                              children: [
                                TaskList(
                                  taskName: task[index].title,
                                  date: task[index].dateToString(),
                                  color: task[index].status == true
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              
                              
                                const SizedBox(height: 20),
                              ],

                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ), 

          const SizedBox(height: 20,),
          Button(
          label: 'Create Task',
          onPressed: (){
            Navigator.pushNamed(context, Routes.addTask);
          
          },
          ) 
          ],
        ),
      ),
      );
    
  }
}