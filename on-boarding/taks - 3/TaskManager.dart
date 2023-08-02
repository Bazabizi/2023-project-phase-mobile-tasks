import 'dart:io';

import '../task - 2/Task.dart';


class TaskManager{
  List<Task>tasks = [];

  void addTask(Task task){
    tasks.add(task);
    
  }
  void removeTask(Task task){
    tasks.remove(task);
  }

  void displayAll(){
    display(tasks);
  }

  void displayComplete(){

    List<Task> tasks = this.Completed();
      display(tasks);
      
    
  }

  void displayPending(){
  
    List<Task> tasks = this.Pending();
      display(tasks);
    
  }

  void editTask(Task previousTask , Task newTask){
    previousTask.title = newTask.title;
    previousTask.description = newTask.description;
    previousTask.dueDate = newTask.dueDate;
    previousTask.status = newTask.status;

  }

  void display(List<Task> task){
    int index = 1;
    for(Task task in tasks){
      print(index);
      print('Title : ${task.title} ');
      print('Description : ${task.description}');
      print('Due Date : ${task.dueDate}');
      print('Status : ${task.status == true? "complete" : "pending"}');
      print('\n\n');
      index++;
    }
  }

  List<Task> Completed(){
    
    List<Task>completedTask = tasks.where((task) => task.status).toList();
    
    return completedTask;
  }
  

  List<Task> Pending(){
    
    List<Task>pendingTask = tasks.where((task) => !task.status).toList();
    
    return pendingTask;
  }

  Task search(){
    this.displayAll();
    int index = int.parse(stdin.readLineSync()?? "-1");

      return tasks[index -1 ];

  }


  Task input(){
    print("Enter the title:");
    String title = (stdin.readLineSync()?? "");
    print("Enter the description:");
    String description = (stdin.readLineSync()?? "");
    print("Enter the due date (YYYY-MM-DD) :");
    DateTime? dueDate = DateTime.tryParse(stdin.readLineSync() ?? DateTime.now().toString());
    print("Is the task completed(Y/N)?");
    String? cur_state = (stdin.readLineSync()??"N");
    
    bool status = true;
    
    // cur_state = cur_state ?? "N";
    if(cur_state.toLowerCase() == "n" || cur_state == ""){
      status = false;
    }
    Task newTask = Task(title: title, description: description , dueDate: dueDate?? DateTime.now() , status: status);

    return newTask;
  }  
}
