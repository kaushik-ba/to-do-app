import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoItems=[];
  final box=Hive.box('todobox');
  void onCreate(){
    toDoItems.add(["Example task",false]);
  }
  void load(){
    toDoItems=box.get(1);
  }
  void update(){
    box.put(1,toDoItems);
  }

}