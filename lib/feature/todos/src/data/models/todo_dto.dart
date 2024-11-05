import 'package:json_annotation/json_annotation.dart';

part 'generated/todo_dto.g.dart';

@JsonSerializable()
class TodoDto {
  final String? id;
  final String? title;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final bool? done;

  const TodoDto({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.done,
  });

  factory TodoDto.fromJson(Map<String, dynamic> json) => _$TodoDtoFromJson(json);

  TodoDto copyWith({
    String? id,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
    bool? done,
  }) {
    return TodoDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      done: done ?? this.done,
    );
  }
}
