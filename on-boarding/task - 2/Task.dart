
class Task {
  String _title;
  String _description;
  DateTime _dueDate;
  bool _status;

  
  Task({required this.title , required this.description , required this.dueDate , required this.status});

  set title(String title){ 
    _title = title;
  }

  set description(String description){
    _description = description;
  }

  set dueDate(DateTime dueDate){
    _dueDate = dueDate;
  }

  set status(bool status){
    _status = status;
  }

  String get title => _title;
  
  String get description => _description;
  
  DateTime get dueDate => _dueDate;
  
  Bool get status => _status;
  
  
}
