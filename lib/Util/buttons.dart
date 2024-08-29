import 'package:flutter/material.dart';

class TButton extends StatelessWidget {
  final String text;
  VoidCallback  onPressed;
  TButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0.1,
        color: Colors.green[200],
        onPressed: onPressed,
      child: Text(text),
    );
  }
}
