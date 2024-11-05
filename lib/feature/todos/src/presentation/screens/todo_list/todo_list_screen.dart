import 'package:flutter/material.dart';
import 'package:todos/feature/todos/src/presentation/screens/todo_list/widgets/config/todo_list_listener.dart';
import 'package:todos/feature/todos/src/presentation/screens/todo_list/widgets/config/todo_list_scope.dart';
import 'package:todos/feature/todos/src/presentation/screens/todo_list/widgets/layout/todo_list_layout.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  static const String name = 'todos';
  static const String path = '/todos';

  @override
  Widget build(BuildContext context) {
    return const TodoListScope(
      child: TodoListListener(
        child: TodoListLayout(),
      ),
    );
  }
}
