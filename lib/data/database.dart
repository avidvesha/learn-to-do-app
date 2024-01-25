import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase{

  List toDoList = [];


  // reference the box
  final _myBox = Hive.box('myBox');

  // this method will run if this is he 1st time ever opening this file
  void createInitialDatabase(){
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load data from db
  void loadDatabase(){
    toDoList = _myBox.get("TODOLIST");
  }

  // update data
  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }
}
