import 'package:todo_app_bloc/entities/todo.dart';

abstract class TodoListRepository {
  Stream<List<Todo>> fetch();
}
