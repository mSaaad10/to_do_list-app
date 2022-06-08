class Todo {
  static const String collectionName = 'todos';
  late String title;
  late String description;
  late bool isDone;
  late DateTime dateTime;
  late String id;

  Todo(
      {required this.dateTime,
      required this.description,
      this.isDone = false,
      required this.title,
      this.id = ''});

  Todo.fromJson(Map<String, dynamic> json) {
    // Timestamp timestamp = json['dateTime'] as Timestamp;
    id = json['id']! as String;
    title = json['title']! as String;
    description = json['description']! as String;
    isDone = json['isDone']! as bool;
    dateTime = DateTime.fromMillisecondsSinceEpoch(json['dateTime']! as int);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }
}