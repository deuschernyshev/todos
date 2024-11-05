import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/todo_list/bloc/todo_list_bloc.dart';

class TodoListListener extends StatelessWidget {
  final Widget child;

  const TodoListListener({
    required this.child,
    super.key,
  });

  void _todoListStateListener(BuildContext context, TodoListState state) {
    if (state.isError) {
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoListBloc, TodoListState>(
      listener: _todoListStateListener,
      child: child,
    );
  }
}
