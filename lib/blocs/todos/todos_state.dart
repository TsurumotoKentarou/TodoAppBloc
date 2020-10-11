import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_bloc/entities/todo.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosEmpty extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosInProgress extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosSuccess extends TodosState {
  final Stream<List<Todo>> todos;

  const TodosSuccess({@required this.todos}) : assert(todos != null);

  @override
  List<Object> get props => [this.todos];
}
