import '../../domain/entities/task.dart';

class TaskModel extends Task{
  const TaskModel({required super.id, required super.title, required super.description, required super.dueDate, required isCompleted});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'].toInt(),
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      isCompleted: json['isCompleted'],
    );
    
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "dueDate": dueDate.toString(),
      "isCompleted": isCompleted,
    };
  }
}