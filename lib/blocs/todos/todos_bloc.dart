import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todos/todos_event.dart';
import 'package:todo_app_bloc/blocs/todos/todos_state.dart';
import 'package:todo_app_bloc/repositories/todos/todos_repository.dart';

class TodoBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository repository;

  TodoBloc(TodosState initialState, {@required TodosRepository repository})
      : this.repository = repository,
        super(initialState);

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosLoad) {
      yield* this._mapEventTodosLoadToState();
    }
  }

  Stream<TodosState> _mapEventTodosLoadToState() async* {
    yield TodosInProgress();
    try {
      yield TodosSuccess(todos: this.repository.fetch());
    } catch (_) {
      yield TodosError(error: _);
    }
  }
}
