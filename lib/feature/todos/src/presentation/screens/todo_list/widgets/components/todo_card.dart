import 'package:flutter/material.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onPressed;

  const TodoCard({
    required this.todo,
    this.onPressed,
    super.key,
  });

  Color get _badgeColor => todo.done ? Colors.green : Colors.red;
  String get _badgeText => todo.done ? 'Completed' : 'Todo';

  @override
  Widget build(BuildContext context) {
    return Badge(
      alignment: Alignment.topLeft,
      backgroundColor: _badgeColor,
      label: Text(_badgeText),
      child: Card(
        child: ListTile(
          onTap: onPressed,
          title: Text(todo.title),
          subtitle: Text(todo.description),
          leading: const Icon(Icons.query_builder_sharp),
          trailing: const Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
