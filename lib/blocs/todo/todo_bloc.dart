import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todo/todo_event.dart';
import 'package:todo_app_bloc/blocs/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(TodoState initialState) : super(initialState);

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) {
    throw UnimplementedError();
  }
}
