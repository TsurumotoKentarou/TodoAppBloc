import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            child: Text(
              'アイイfじょあsjふぉ',
              maxLines: 1,
            ),
          ),
        ),
        Container(
          child: Checkbox(value: false, onChanged: (check) => {print(check)}),
        )
      ],
    );
  }
}
