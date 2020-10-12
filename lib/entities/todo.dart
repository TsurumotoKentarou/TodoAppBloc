import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

// ジェネレートされたクラスからUserクラスのprivateメンバ変数にアクセスするため
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  String name;
  bool isDone;

  Todo({@required this.name, @required this.isDone});
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
