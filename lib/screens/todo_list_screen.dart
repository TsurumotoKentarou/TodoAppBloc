import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todos/todos_bloc.dart';
import 'package:todo_app_bloc/blocs/todos/todos_event.dart';
import 'package:todo_app_bloc/blocs/todos/todos_state.dart';
import 'package:todo_app_bloc/entities/todo.dart';
import 'package:todo_app_bloc/repositories/todos/todos_repository_impl.dart';
import 'package:todo_app_bloc/views/todo_list_view.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = TodoBloc(TodosEmpty(), repository: TodosRepositoryImpl());
    bloc.add(TodosLoad());
    return Scaffold(
        appBar: AppBar(title: Text('Todoアプリ')),
        body: BlocBuilder<TodoBloc, TodosState>(
          cubit: bloc,
          builder: (context, state) {
            if (state is TodosEmpty) {
              return Text('TodosEmpty');
            } else if (state is TodosInProgress) {
              return Text('TodosInProgress');
            } else if (state is TodosSuccess) {
              return StreamBuilder(
                  stream: state.todos,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Todo>> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return TodoListView(todos: snapshot.data);
                  });
            } else if (state is TodosError) {
              return Text('エラーが発生したぞ: TodosError');
            } else {
              return Text('');
            }
          },
        ));
  }
}
