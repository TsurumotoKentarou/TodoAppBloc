import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_bloc/entities/todo.dart';
import 'package:todo_app_bloc/views/todo_item_view.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todoList;
  TodoListView({@required List<Todo> todoList}) : this.todoList = todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return TodoItemView(
            todo: this.todoList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: this.todoList.length);
  }
}
