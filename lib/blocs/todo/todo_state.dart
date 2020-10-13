import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoEmpty extends TodoState {
  const TodoEmpty();

  @override
  List<Object> get props => [];
}

// Todoの追加
class TodoAdding extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoAddSuccess extends TodoState {
  final Stream<DocumentReference> todoReference;

  TodoAddSuccess({@required this.todoReference});

  @override
  List<Object> get props => [this.todoReference];
}

class TodoAddError extends TodoState {
  final Error error;

  TodoAddError(this.error);

  @override
  List<Object> get props => [];
}

// Todoの更新
class TodoUpdating extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoUpdateSuccess extends TodoState {
  final Stream<DocumentReference> todoReference;

  TodoUpdateSuccess({@required this.todoReference});

  @override
  List<Object> get props => [this.todoReference];
}

class TodoUpdateError extends TodoState {
  final Error error;

  TodoUpdateError(this.error);

  @override
  List<Object> get props => [];
}

// Todoの削除
class TodoDeleting extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoDeleteSuccess extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoDeleteError extends TodoState {
  final Error error;

  TodoDeleteError(this.error);

  @override
  List<Object> get props => [];
}
