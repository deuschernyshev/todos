import 'package:todos/feature/todos/src/data/models/todo_dto.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';

extension TodoToDto on Todo {
  TodoDto toDto() {
    return TodoDto(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt.toIso8601String(),
      updatedAt: updatedAt.toIso8601String(),
      done: done,
    );
  }
}
