//pour utiliser la bd, nous devons importer quelques paquages
//1)sqflite 2)path
import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './todo_model.dart';

class DatabaseConnect {
  Database? _database;

  //creation du getter et de la chaine de connection a la bd
  Future<Database> get database async {
    //emplacement de la bd dans le telephone. ex: data/data/...
    final dbPath = await getDatabasesPath();
    //nom de la bd
    const dbName = 'todo.db';
    //joindre le chemin et la db ex:/data/data/todo.db
    final path = join(dbPath, dbName);

    //ouvrir la connection

    _database = await openDatabase(path, version: 3, onCreate: _createDb);

    //nous allons creer la fonction create db
    return _database!;
  }

  //creation de la fonction _createDb
  //creation des tables
  Future<void> _createDb(Database db, int version) async {
    //se rassurer que les colonnes des tables sont en accord avec le model
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        creationDate TEXT,
        isChecked INTEGER
      )
    ''');//string sur plusieurs lignes (''')
  }
//fonction pour ajouter

  Future<void> insertTodo(Todo todo) async {
    //connection
    final db = await database;
    //insertion
    await db.insert(
      'todo',
      todo.toMap(), //fonction de note model
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //delete

  Future<void> deleteTodo(Todo todo) async {
    final db = await database;
    await db.delete('todo', where: 'id == ?', whereArgs: [todo.id]);
  }

  //function to fetch all the todo data from our db

  Future<List<Todo>> getTodo() async {
    final db = await database;
    //query the database and save the to as list of maps

    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC',
    );
    //convertissons les donnees de list de maps en liste de todo
    return List.generate(items.length,
     (i) => Todo(
      id: items[i]['id'],
      title:items[i]['title'],
       creationDate:DateTime.parse(items[i]['creationDate']), 
       isChecked:items[i]['isChecked'] ==1? true : false,
       )
     );
  }
}
