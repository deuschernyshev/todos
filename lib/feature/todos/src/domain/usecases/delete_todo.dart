import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/domain/repositories/todo_repo.dart';

final class DeleteTodo {
  final TodoRepo _repo;

  const DeleteTodo(this._repo);

  Future<void> deleteTodo(Todo todo) {
    return _repo.deleteTodo(todo);
  }
}
