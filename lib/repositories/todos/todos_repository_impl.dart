import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_bloc/entities/todo.dart';
import 'package:todo_app_bloc/repositories/todos/todos_repository.dart';

class TodosRepositoryImpl extends TodosRepository {
  @override
  Stream<List<Todo>> fetch() {
    // final data =  FirebaseFirestore.instance
    //     .collection('todos')
    //     .snapshots();
    //
    return FirebaseFirestore.instance
        .collection('todos')
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        Map<String, dynamic> data = e.data();
        final todo = Todo(name: data['name'], isDone: false);
        return todo;
      }).toList();
    });
  }
}
