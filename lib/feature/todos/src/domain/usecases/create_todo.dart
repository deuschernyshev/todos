import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/domain/repositories/todo_repo.dart';

final class CreateTodo {
  final TodoRepo _repo;

  const CreateTodo(this._repo);

  Future<void> createTodo(Todo todo) {
    return _repo.createTodo(todo);
  }
}
