
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final String taskName;
  final bool taskDone;
  final Function(bool?)? onChanged;
  VoidCallback delete;
  ToDoItem({super.key, required this.taskName, required this.taskDone, this.onChanged,required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Container(
        padding:const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(value: taskDone, onChanged: onChanged),
            Expanded(child: Text(
                taskName,
              style:  TextStyle(
                decoration: taskDone ?TextDecoration.lineThrough:TextDecoration.none,
              ),
              )
            ),
            const SizedBox(width: 5),
            TextButton(onPressed: delete, child: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
