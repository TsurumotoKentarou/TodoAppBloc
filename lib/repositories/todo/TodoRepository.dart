import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_bloc/entities/todo.dart';

abstract class TodoRepository {
  Stream<DocumentReference> add({@required Todo todo});

  Stream<DocumentReference> update({@required Todo todo});
}
