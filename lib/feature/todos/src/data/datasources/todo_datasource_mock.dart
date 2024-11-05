import 'package:todos/feature/todos/src/data/datasources/todo_datasource.dart';
import 'package:todos/feature/todos/src/data/models/todo_dto.dart';
import 'package:uuid/uuid.dart';

final class TodoDatasourceMock implements TodoDatasource {
  const TodoDatasourceMock();

  static final List<TodoDto> _todos = [];

  @override
  Future<void> createTodo(TodoDto todo) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    const uuid = Uuid();
    final todoId = uuid.v4();
    final newTodo = todo.copyWith(id: todoId);

    _todos.add(newTodo);
  }

  @override
  Future<void> updateTodo(TodoDto todo) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final index = _todos.indexWhere((e) => e.id == todo.id);

    _todos[index] = todo;
  }

  @override
  Future<TodoDto> getTodoById(String id) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final todo = _todos.firstWhere((e) => e.id == id);

    return todo;
  }

  @override
  Future<List<TodoDto>> getTodos() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    return _todos;
  }

  @override
  Future<void> deleteTodo(TodoDto todo) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    _todos.removeWhere((e) => e.id == todo.id);
  }
}
