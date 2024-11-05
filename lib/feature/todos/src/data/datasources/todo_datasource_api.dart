import 'package:todos/feature/todos/src/data/datasources/todo_datasource.dart';
import 'package:todos/feature/todos/src/data/models/todo_dto.dart';

final class TodoDatasourceApi implements TodoDatasource {
  // final ApiClient _apiClient;

  const TodoDatasourceApi(/* this._apiClient */);

  @override
  Future<void> createTodo(TodoDto todo) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(TodoDto todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoDto> getTodoById(String id) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }

  @override
  Future<List<TodoDto>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(TodoDto todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
