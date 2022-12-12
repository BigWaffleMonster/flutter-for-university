import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:notes_app/models/todo.model.dart';
import 'package:sqflite/sqlite_api.dart';

class TodoRepository {
  Future<List<Todo>> getTodos({
    required Database database,
  }) async {
    final datas = await database.rawQuery('SELECT * FROM todo');
    List<Todo> todos = [];
    for (var item in datas) {
      todos.add(Todo(item['id'] as int, item['name'] as String));
    }
    return todos;
  }

  Future<dynamic> addTodo({
    required Database database,
    required String text,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawInsert("INSERT INTO todo (name) VALUES ('$text')");
    });
  }

  Future<dynamic> removeTodo({
    required Database database,
    required int id,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM todo where id = $id');
    });
  }

  Future<TodoFromApi> fetchTodo() async {
    Random random = Random();
    int randomNumber = random.nextInt(201);

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$randomNumber'),
    );

    if (response.statusCode == 200) {
      return TodoFromApi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
