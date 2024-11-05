import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/domain/repositories/todo_repo.dart';

final class GetTodos {
  final TodoRepo _repo;

  const GetTodos(this._repo);

  Future<List<Todo>> getTodos() {
    return _repo.getTodos();
  }

  Future<Todo> getTodoById(String id) {
    return _repo.getTodoById(id);
  }
}
