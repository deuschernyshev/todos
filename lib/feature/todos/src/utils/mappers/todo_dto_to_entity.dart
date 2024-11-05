import 'package:todos/feature/todos/src/data/models/todo_dto.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';

extension TodoDtoToEntity on TodoDto {
  Todo toEntity() {
    return Todo(
      id: id,
      title: title!,
      description: description!,
      createdAt: DateTime.parse(createdAt!),
      updatedAt: DateTime.parse(updatedAt!),
      done: done ?? false,
    );
  }
}
