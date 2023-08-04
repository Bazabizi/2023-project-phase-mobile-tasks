import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/customTextInput.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding:  EdgeInsets.only(left: 10),
          child:  Icon(
            Icons.arrow_back_ios,
            color: Colors.red,
            size : 38,
            ),
        ),
        title: const Text(
          'Create new task',
          style:  TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 38,
            ),
          )
        ],
      ),
      
      body: const  Column(
        children: [

          SizedBox(height: 20,),
          CustomTextInput(
            label: 'Main task name', 
            lines: 1,
          ),

          CustomTextInput(
            label: 'Due date',
            lines: 1,
            customIcon: Icon(Icons.calendar_month),
          ),

          CustomTextInput(
            label:"Description", 
            lines: 2,

          ) ,
          SizedBox(height: 10,),
           Button(
            label: 'Add Task',
            ),
        ],
        ),

    );
  }
}
