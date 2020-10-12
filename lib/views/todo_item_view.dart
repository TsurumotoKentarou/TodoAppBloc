import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_bloc/entities/todo.dart';

class TodoItemView extends StatelessWidget {
  final Todo todo;

  TodoItemView({@required Todo todo}) : this.todo = todo;

  @override
  Widget build(BuildContext context) {
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
                    print('check is : ${check}'),
                    this.todo.isDone = check,
                  }),
        )
      ],
    );
  }
}
