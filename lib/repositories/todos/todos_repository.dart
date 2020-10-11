import 'package:todo_app_bloc/entities/todo.dart';

abstract class TodosRepository {
  Stream<List<Todo>> fetch();
}
