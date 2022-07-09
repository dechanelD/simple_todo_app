import 'package:flutter/material.dart';
import 'package:flutter0/models/db_model.dart';
import 'package:flutter0/models/todo_model.dart';
import 'package:flutter0/screens/homePage.dart';
//package intl pour le format de date
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
