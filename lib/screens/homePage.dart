import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter0/models/db_model.dart';
import 'package:flutter0/models/todo_model.dart';
import 'package:flutter0/widgets/todo_card.dart';
import 'package:flutter0/widgets/todo_list.dart';

import '../widgets/UserInput.dart';
import '../widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creation de la fonction ou les deux widgets vont communiquer

  //creation d'un objet db qui va acceder aux fonctions de la bd
  var db = DatabaseConnect();

  //fonction pour ajouter
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  //fonction pour ajouter
  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple todo app'),
      ),
      body: Column(children: [
        TodoList(insertFunction: addItem, deleteFunction: deleteItem,),
        UserInput(insertFunction: addItem),
      ]),
    );
  }
}
