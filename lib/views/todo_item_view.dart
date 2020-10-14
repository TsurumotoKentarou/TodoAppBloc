import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todo/todo_bloc.dart';
import 'package:todo_app_bloc/blocs/todo/todo_event.dart';
import 'package:todo_app_bloc/blocs/todo/todo_state.dart';
import 'package:todo_app_bloc/blocs/todolist/todo_list.dart';
import 'package:todo_app_bloc/entities/todo.dart';
import 'package:todo_app_bloc/repositories/todo/TodoRepositoryImpl.dart';

class TodoItemView extends StatelessWidget {
  final Todo todo;

  TodoItemView({@required Todo todo}) : this.todo = todo;

  @override
  Widget build(BuildContext context) {
    final TodoBloc todoBloc =
        TodoBloc(repository: TodoRepositoryImpl(), initialState: TodoEmpty());
    return BlocBuilder(
        cubit: todoBloc,
        builder: (context, state) {
          return StreamBuilder(builder: (BuildContext context, _) {
            if (state is TodoUpdateSuccess) {
              final TodoListBloc todoListBloc =
                  BlocProvider.of<TodoListBloc>(context);
              // todoListBloc.add(TodoListLoad());
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      '${this.todo.name}',
                      maxLines: 1,
                    ),
                  ),
                ),
                Container(
                  child: Checkbox(
                      value: this.todo.isDone,
                      onChanged: (check) => {
                            this.todo.isDone = check,
                            todoBloc.add(UpdateTodo(todo: this.todo)),
                          }),
                )
              ],
            );
          });
        });
  }
}
