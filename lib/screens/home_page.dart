import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:remainder_app/Util/dialog_box.dart';
import 'package:remainder_app/Util/todo_database.dart';
import 'package:remainder_app/Util/todo_item.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final  _controller=TextEditingController();
  final _myBox=Hive.box("todobox");
  ToDoDatabase db= ToDoDatabase();
  void toggle(bool? toggler,int index){
    db.toDoItems[index][1]=toggler;
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    if(_myBox.get(1)==null){
      db.onCreate();
    }
    else{
      db.load();
    }
    super.initState();
  }
  void save(){
    setState(() {
      db.toDoItems.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.update();
  }
  void delete(int index){
    setState(() {
      db.toDoItems.removeAt(index);
    });
    db.update();
  }
  void createNew(){
    showDialog(context: context, builder: (context){
      return DialogBox(inputText: _controller,save: save,delete: ()=>Navigator.of(context).pop());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      floatingActionButton: FloatingActionButton(
        onPressed: createNew,
        child: const Icon(Icons.add)
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text("To do"),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: db.toDoItems.length,
        itemBuilder: (context,index){
          return ToDoItem(taskName: db.toDoItems[index][0], taskDone: db.toDoItems[index][1], onChanged: (value)=>toggle(value,index),delete: ()=>delete(index),);
        },
      ),
    );
  }
}
