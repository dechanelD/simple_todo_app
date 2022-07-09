import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter0/models/todo_model.dart';

class UserInput extends StatelessWidget {
  final Function insertFunction;
  final textController = TextEditingController();
  UserInput({required this.insertFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Row(children: [
          //input box
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            //color: Color(0xffd485ff),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Ajouter une nouvelle tache',
                  //border: InputBorder.none,
                ),
              ),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          //boutton
          GestureDetector(
            onTap: () {
              //creation d'un objet todo
              var myTodo = Todo(
                  title: textController.text,
                  creationDate: DateTime.now(),
                  isChecked: false);
              //envoyer comme parametre de la fonction inserfunction
              insertFunction(myTodo);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'Ajouter',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
