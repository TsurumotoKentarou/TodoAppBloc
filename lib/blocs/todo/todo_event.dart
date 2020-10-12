import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_bloc/entities/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodo extends TodoEvent {
  final Todo todo;

  AddTodo({@required Todo todo})
      : this.todo = todo,
        assert(todo != null);

  @override
  List<Object> get props => [this.todo];
}

class UpdateTodo extends TodoEvent {
  final Todo todo;

  UpdateTodo({@required Todo todo})
      : this.todo = todo,
        assert(todo != null);

  @override
  List<Object> get props => [this.todo];
}
