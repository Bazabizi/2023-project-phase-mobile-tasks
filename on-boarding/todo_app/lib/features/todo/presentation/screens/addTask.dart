import 'package:flutter/material.dart';
import 'package:todo_app/features/todo/Model/TaskManager.dart';
import 'package:todo_app/features/todo/presentation/screens/todo_list.dart';

import '../../../../routes.dart';
import '../../Model/Task.dart';
import '../widgets/button_add_task.dart';
import '../widgets/customTextInput.dart';

class AddTask extends StatefulWidget {
  
  
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();
  TextEditingController _taskDueDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding:  EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.red,
            iconSize: 38,
            onPressed: () {
              Navigator.pop(context);
            },
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
      
      body: ListView(
        
        children: [

          SizedBox(height: 20,),
          CustomTextInput(
            label: 'Main task name', 
            lines: 1,
            controller :_taskNameController,
          ),

          CustomTextInput(
            label: 'Due date',
            lines: 1,
            controller : _taskDueDateController,
            customIcon: Icon(Icons.calendar_month),
          ),

          CustomTextInput(
            label:"Description", 
            lines: 2,
            controller :_taskDescriptionController,

          ) ,
          const SizedBox(height: 10,),
            Wrap(
              children: [
                Center(
                  child: Button(
                  label: 'Add Task',
                  onPressed: (){
                    addTask();
                    }
                    ,
                  ),
                ),
              ],
            ),
        ],
        ),

    );
  }
  
  void addTask() {
    String taskName = _taskNameController.text;
    String taskDescription = _taskDescriptionController.text;
    DateTime? taskDueDate = DateTime.tryParse(_taskDueDateController.text);
    if (taskName.isNotEmpty && taskDescription.isNotEmpty && taskDueDate != null) {
      Task newTask = Task(
        title: taskName,
        description: taskDescription,
         dueDate: taskDueDate,
         status: false
      );
      //tasks is a list of tasks 
      TaskManager.tasks.add(newTask);

      
      Navigator.pushNamed(context, Routes.todoList);
      
      
    
    }
  }
}

