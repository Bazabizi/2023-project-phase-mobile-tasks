
class Task {
    String title;
    String description;
    DateTime dueDate;
    bool status;


    Task({required this.title , required this.description , required this.dueDate , required this.status});
      
    String dateToString(){
      return '${dueDate.day}/${dueDate.month}/${dueDate.year}';
    }

}
