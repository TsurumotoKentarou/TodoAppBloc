import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoAdding extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoUpdating extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoDeleting extends TodoState {
  @override
  List<Object> get props => [];
}
