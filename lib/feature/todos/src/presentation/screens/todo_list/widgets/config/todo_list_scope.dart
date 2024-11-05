import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/feature/todos/src/domain/repositories/todo_repo.dart';
import 'package:todos/feature/todos/src/domain/usecases/get_todos.dart';
import 'package:todos/feature/todos/src/presentation/screens/todo_list/bloc/todo_list_bloc.dart';

class TodoListScope extends StatelessWidget {
  final Widget child;

  const TodoListScope({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoListBloc>(
      create: _createBloc,
      child: child,
    );
  }

  TodoListBloc _createBloc(BuildContext context) {
    final bloc = TodoListBloc(
      getTodos: GetTodos(
        context.read<TodoRepo>(),
      ),
    );

    bloc.add(const TodoListEvent.init());

    return bloc;
  }
}
