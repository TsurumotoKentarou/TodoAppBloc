import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todo/todo_event.dart';
import 'package:todo_app_bloc/blocs/todo/todo_state.dart';
import 'package:todo_app_bloc/repositories/todo/TodoRepository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc({@required this.repository, @required TodoState initialState})
      : super(initialState);

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddTodo) {
      yield TodoAdding();
      try {
        yield TodoAddSuccess(
            todoReference: this.repository.add(todo: event.todo));
      } catch (e) {
        yield TodoAddError(e);
      }
    } else if (event is UpdateTodo) {
      yield TodoUpdating();
      try {
        yield TodoUpdateSuccess(
            todoReference: this.repository.update(todo: event.todo));
      } catch (e) {
        yield TodoUpdateError(e);
      }
    }
  }
}
