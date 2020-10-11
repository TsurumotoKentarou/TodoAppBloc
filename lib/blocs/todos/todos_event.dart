import 'package:equatable/equatable.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class TodosLoad extends TodosEvent {
  @override
  List<Object> get props => [];
}