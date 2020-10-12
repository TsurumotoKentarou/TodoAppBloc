import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_bloc/entities/todo.dart';

abstract class TodoListState extends Equatable {
  const TodoListState();
}

class TodoListEmpty extends TodoListState {
  @override
  List<Object> get props => [];
}

class TodoListInProgress extends TodoListState {
  @override
  List<Object> get props => [];
}

class TodoListSuccess extends TodoListState {
  final Stream<List<Todo>> todoList;

  const TodoListSuccess({@required this.todoList}) : assert(todoList != null);

  @override
  List<Object> get props => [this.todoList];
}

class TodoListError extends TodoListState {
  final Error error;

  TodoListError({@required Error error}) : this.error = error;

  @override
  List<Object> get props => [];
}
