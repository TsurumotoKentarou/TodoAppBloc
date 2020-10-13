// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
    json['documentId'] as String,
    name: json['name'] as String,
    isDone: json['isDone'] as bool,
  );
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'isDone': instance.isDone,
    };
