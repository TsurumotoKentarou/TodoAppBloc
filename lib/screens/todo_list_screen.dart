import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todolist/todo_list.dart';
import 'package:todo_app_bloc/entities/todo.dart';
import 'package:todo_app_bloc/repositories/todolist/todo_list_repository_impl.dart';
import 'package:todo_app_bloc/views/todo_list_view.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc =
        TodoBloc(TodoListEmpty(), repository: TodoListRepositoryImpl());
    bloc.add(TodoListLoad());
    return Scaffold(
        appBar: AppBar(title: Text('Todoアプリ')),
        body: BlocBuilder<TodoBloc, TodoListState>(
          cubit: bloc,
          builder: (context, state) {
            if (state is TodoListEmpty) {
              return Text('TodoListEmpty');
            } else if (state is TodoListInProgress) {
              return Text('TodoListInProgress');
            } else if (state is TodoListSuccess) {
              return StreamBuilder(
                  stream: state.todoList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Todo>> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return TodoListView(todoList: snapshot.data);
                  });
            } else if (state is TodoListError) {
              return Text('エラーが発生したぞ: TodoListError');
            } else {
              return Text('');
            }
          },
        ));
  }
}
