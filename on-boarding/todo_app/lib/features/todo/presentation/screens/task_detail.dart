import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/Model/Task.dart';
import '../widgets/navigation.dart';
import '../widgets/task_element.dart';

class TaskDetail extends StatelessWidget {
  final Task task;  
  const TaskDetail({Key?key,  required this.task, }):super(key: key);

  @override
  Widget build(BuildContext context) {
  // final task = ModalRoute.of()!.settings.arguments as Task;


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top:20,
          left:30,
          right:30,
          bottom: 30,
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Navigation(
              title: 'Task Detail',
              ),
            Image(
              image: AssetImage(
                'assets/images/task_detail.png' ,
                ),
            ),
            TaskElements(
              title: 'Title',
              subtitle: task.title,
            ),
            TaskElements(
              title: "Description",
              subtitle:task.description,
              ),
              
            TaskElements(
              title: "Deadline",
              subtitle: task.dateToString(),
              ),
          ],
        ),
      )
      
    );
  }
}