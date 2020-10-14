import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(toJson: _toNull, includeIfNull: false)
  final String documentId;
  String name;
  bool isDone;

  static _toNull(_) => null;

  Todo({this.documentId, @required this.name, @required this.isDone});
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
