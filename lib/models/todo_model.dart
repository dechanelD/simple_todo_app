class Todo {
  int? id;
  late final String title;
  late DateTime creationDate;
  bool isChecked;

  Todo(
      {this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked});

//convertir les donnees en map pour sauvegarder en bd
//creation d'une fonction adequate

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate
          .toString(), //spflite ne supporte pas le type DateTime donc, on converti en string
      'isChecked': isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'Todo(id : $id, title:$title, creationDate:$creationDate, isChecked:$isChecked)';
  }
}
