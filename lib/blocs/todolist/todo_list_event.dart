import 'package:equatable/equatable.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();
}

class TodoListLoad extends TodoListEvent {
  @override
  List<Object> get props => [];
}
