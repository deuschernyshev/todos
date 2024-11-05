import 'package:flutter/material.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/widgets/config/edit_todo_listener.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/widgets/config/edit_todo_scope.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/widgets/layout/edit_todo_layout.dart';

enum EditTodoType {
  create,
  update;

  String get title => switch (this) {
        create => 'Create Todo',
        update => 'Update Todo',
      };
}

class EditTodoScreen extends StatelessWidget {
  final String? todoId;

  static const String name = 'edit-todo';
  static const String path = '/edit-todo';

  const EditTodoScreen({
    this.todoId,
    super.key,
  });

  EditTodoType get _editTodoType => todoId == null ? EditTodoType.create : EditTodoType.update;

  @override
  Widget build(BuildContext context) {
    return EditTodoScope(
      todoId: todoId,
      child: EditTodoListener(
        child: EditTodoLayout(
          editTodoType: _editTodoType,
        ),
      ),
    );
  }
}
