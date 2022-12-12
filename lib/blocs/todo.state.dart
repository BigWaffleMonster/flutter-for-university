import 'package:equatable/equatable.dart';
import 'package:notes_app/models/todo.model.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class InitTodoState extends TodoState {
  final int counter;

  const InitTodoState(this.counter);

  @override
  List<Object> get props => [counter];
}

class AddTodoState extends TodoState {}

class RemoveTodoState extends TodoState {}
