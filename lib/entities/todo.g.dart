// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
    name: json['name'] as String,
    isDone: json['isDone'] as bool,
  );
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'name': instance.name,
      'isDone': instance.isDone,
    };
