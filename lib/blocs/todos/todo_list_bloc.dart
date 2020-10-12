import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todos/todo_list_event.dart';
import 'package:todo_app_bloc/blocs/todos/todo_list_state.dart';
import 'package:todo_app_bloc/repositories/todos/todo_list_repository.dart';

class TodoBloc extends Bloc<TodoListEvent, TodoListState> {
  final TodoListRepository repository;

  TodoBloc(TodoListState initialState,
      {@required TodoListRepository repository})
      : this.repository = repository,
        super(initialState);

  @override
  Stream<TodoListState> mapEventToState(TodoListEvent event) async* {
    if (event is TodoListLoad) {
      yield* this._mapEventTodoListLoadToState();
    }
  }

  Stream<TodoListState> _mapEventTodoListLoadToState() async* {
    yield TodoListInProgress();
    try {
      yield TodoListSuccess(todos: this.repository.fetch());
    } catch (_) {
      yield TodoListError(error: _);
    }
  }
}
