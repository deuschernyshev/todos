import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/domain/repositories/todo_repo.dart';

final class UpdateTodo {
  final TodoRepo _repo;

  const UpdateTodo(this._repo);

  Future<void> updateTodo(Todo todo) {
    return _repo.updateTodo(todo);
  }
}
