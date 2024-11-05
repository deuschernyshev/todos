import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/feature/todos/src/domain/repositories/todo_repo.dart';
import 'package:todos/feature/todos/src/domain/usecases/create_todo.dart';
import 'package:todos/feature/todos/src/domain/usecases/delete_todo.dart';
import 'package:todos/feature/todos/src/domain/usecases/get_todos.dart';
import 'package:todos/feature/todos/src/domain/usecases/update_todo.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/form/edit_todo_form_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/init/edit_todo_init_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/submit/edit_todo_submit_bloc.dart';

class EditTodoScope extends StatelessWidget {
  final String? todoId;
  final Widget child;

  const EditTodoScope({
    required this.todoId,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditTodoInitBloc>(
          create: _createInitBloc,
        ),
        BlocProvider<EditTodoFormBloc>(
          create: _createFormBloc,
        ),
        BlocProvider<EditTodoSubmitBloc>(
          create: _createSubmitBloc,
        ),
      ],
      child: child,
    );
  }

  EditTodoInitBloc _createInitBloc(BuildContext context) {
    final bloc = EditTodoInitBloc(
      getTodos: GetTodos(
        context.read<TodoRepo>(),
      ),
    );

    if (todoId != null) {
      bloc.add(EditTodoInitEvent.init(todoId!));
    }

    return bloc;
  }

  EditTodoFormBloc _createFormBloc(BuildContext context) {
    final bloc = EditTodoFormBloc();

    return bloc;
  }

  EditTodoSubmitBloc _createSubmitBloc(BuildContext context) {
    final bloc = EditTodoSubmitBloc(
      createTodo: CreateTodo(
        context.read<TodoRepo>(),
      ),
      updateTodo: UpdateTodo(
        context.read<TodoRepo>(),
      ),
      deleteTodo: DeleteTodo(
        context.read<TodoRepo>(),
      ),
    );

    return bloc;
  }
}
