import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todolist/todo_list_event.dart';
import 'package:todo_app_bloc/blocs/todolist/todo_list_state.dart';
import 'package:todo_app_bloc/repositories/todolist/todo_list_repository.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final TodoListRepository repository;

  TodoListBloc(TodoListState initialState, {@required this.repository})
      : super(initialState);

  @override
  Stream<TodoListState> mapEventToState(TodoListEvent event) async* {
    if (event is TodoListLoad) {
      yield* this._mapEventTodoListLoadToState();
    }
  }

  Stream<TodoListState> _mapEventTodoListLoadToState() async* {
    yield TodoListInProgress();
    try {
      yield TodoListSuccess(todoList: this.repository.fetch());
    } catch (_) {
      yield TodoListError(error: _);
    }
  }
}
