import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_bloc/entities/todo.dart';
import 'package:todo_app_bloc/repositories/todolist/todo_list_repository.dart';

class TodoListRepositoryImpl extends TodoListRepository {
  @override
  Stream<List<Todo>> fetch() {
    return FirebaseFirestore.instance
        .collection('todos')
        .get()
        .then((querySnapshot) {
      return querySnapshot.docs.map((e) {
        Map<String, dynamic> data = e.data();
        data['documentId'] = e.id;
        final Todo todo = Todo.fromJson(data);
        return todo;
      }).toList();
    }).asStream();
  }
}
