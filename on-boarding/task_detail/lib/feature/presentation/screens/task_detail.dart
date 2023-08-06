import 'package:flutter/material.dart';
import 'package:task_detail/feature/presentation/widgets/navigation.dart';

import '../widgets/task_element.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
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
              subtitle: 'UI/UX App Design',
            ),
            TaskElements(
              title: "Description",
              subtitle:"First I have animate the logo and prototyping my design.It's very important.",
              ),
            TaskElements(
              title: "Deadline",
              subtitle: "April 29, 2023",
              ),
          ],
        ),
      )
      
    );
  }
}