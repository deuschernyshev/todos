import 'package:todos/feature/todos/src/domain/entities/todo.dart';

abstract interface class TodoRepo {
  Future<List<Todo>> getTodos();

  Future<Todo> getTodoById(String id);

  Future<void> createTodo(Todo todo);

  Future<void> updateTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);
}
