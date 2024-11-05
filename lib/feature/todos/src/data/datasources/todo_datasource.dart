import 'package:todos/feature/todos/src/data/models/todo_dto.dart';

abstract interface class TodoDatasource {
  Future<List<TodoDto>> getTodos();

  Future<TodoDto> getTodoById(String id);

  Future<void> createTodo(TodoDto todo);

  Future<void> updateTodo(TodoDto todo);

  Future<void> deleteTodo(TodoDto todo);
}
