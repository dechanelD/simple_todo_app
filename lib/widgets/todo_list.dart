import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter0/models/db_model.dart';
import 'package:flutter0/widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  //creation d'un objet de connection a la bd
  //pour passer la todo card, la todo list doit recevoir la fonction
  final insertFunction;
  final deleteFunction;

  final db = DatabaseConnect();
  TodoList(
    {required this.insertFunction,required this.deleteFunction, Key? key}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: db.getTodo(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        var data = snapshot.data; // les donnees qu'on veut voir(liste de todo)
        var datalenght = data!.length;

        return datalenght == 0
            ? const Center(
                child: Text('Aucune donnees'),
              )
            : ListView.builder(
                itemCount: datalenght,
                itemBuilder: (context, i) => TodoCard(
                      id: data[i].id,
                      title: data[i].title,
                      creationDate: data[i].creationDate,
                      isChecked: data[i].isChecked,
                      insertFunction:insertFunction,
                      deleteFunction:deleteFunction,
                    ));
      },
    ));
  }
}
