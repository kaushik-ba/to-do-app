import 'package:flutter/material.dart';

import 'buttons.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController inputText;
  VoidCallback save;
  VoidCallback delete;
   DialogBox({super.key, required this.inputText,required this.save,required this.delete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create a new task",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.green[100],
      content: Container(
        height: 140,
        color: Colors.green[100],
        child:  Column(
          children: [
             TextField(
              controller: inputText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "task..."
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TButton(text: "save", onPressed: save),
                const SizedBox(width: 15),
                TButton(text: "cancel", onPressed: delete),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
