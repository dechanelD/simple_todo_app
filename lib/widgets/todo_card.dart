import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter0/models/todo_model.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';//package intl pour le format de date


class TodoCard extends StatefulWidget {
  TodoCard(
      {required this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked,
      required this.insertFunction,
      required this.deleteFunction,
      Key? key})
      : super(key: key);

  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    //creation d'un todo local

    var anotherTodo = Todo(
        id: widget.id,
        title: widget.title,
        creationDate: DateTime.now(),
        isChecked: widget.isChecked);

    return Card(
      child: Row(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Checkbox(
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value!;
              });

              //changer la valeur de 'anotherTodo' isChek
              anotherTodo.isChecked = value!;
              //inserer dans la bd;

              widget.insertFunction(anotherTodo);
            },
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              DateFormat('dd MM yyyy - hh:mm aaa').format(widget.creationDate),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff8f8f8f),
              ),
            ),
          ],
        )),
        IconButton(
            onPressed: () {
              //methode delete
              widget.deleteFunction(anotherTodo);
            },
            icon: const Icon(Icons.close)),
      ]),
    );
  }
}
