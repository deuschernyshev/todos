// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDto _$TodoDtoFromJson(Map<String, dynamic> json) => TodoDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      done: json['done'] as bool?,
    );

Map<String, dynamic> _$TodoDtoToJson(TodoDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'done': instance.done,
    };
