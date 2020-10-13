import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

// ジェネレートされたクラスからUserクラスのprivateメンバ変数にアクセスするため
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  final String documentId;
  String name;
  bool isDone;

  Todo(this.documentId, {@required this.name, @required this.isDone});
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
