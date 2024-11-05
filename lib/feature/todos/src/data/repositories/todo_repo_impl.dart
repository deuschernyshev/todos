import 'package:todos/feature/todos/src/data/datasources/todo_datasource.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/domain/repositories/todo_repo.dart';
import 'package:todos/feature/todos/src/utils/mappers/todo_dto_to_entity.dart';
import 'package:todos/feature/todos/src/utils/mappers/todo_to_dto.dart';

final class TodoRepoImpl implements TodoRepo {
  final TodoDatasource _datasource;

  const TodoRepoImpl(this._datasource);

  @override
  Future<void> createTodo(Todo todo) async {
    final todoDto = todo.toDto();

    return _datasource.createTodo(todoDto);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todoDto = todo.toDto();

    return _datasource.updateTodo(todoDto);
  }

  @override
  Future<Todo> getTodoById(String id) async {
    final dto = await _datasource.getTodoById(id);

    final todo = dto.toEntity();

    return todo;
  }

  @override
  Future<List<Todo>> getTodos() async {
    final dtos = await _datasource.getTodos();

    final todos = dtos.map((e) => e.toEntity()).toList();

    return todos;
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todoDto = todo.toDto();

    return _datasource.deleteTodo(todoDto);
  }
}
