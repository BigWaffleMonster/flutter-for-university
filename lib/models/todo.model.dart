class Todo {
  final int id;
  final String text;

  Todo(this.id, this.text);
}

class TodoFromApi {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const TodoFromApi({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoFromApi.fromJson(Map<String, dynamic> json) {
    return TodoFromApi(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
