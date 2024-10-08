import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:remainder_app/screens/home_page.dart';

void main() async{

  await Hive.initFlutter();
  await Hive.openBox("todobox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage()
    );
  }
}
