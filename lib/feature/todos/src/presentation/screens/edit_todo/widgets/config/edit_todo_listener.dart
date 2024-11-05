import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/form/edit_todo_form_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/init/edit_todo_init_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/submit/edit_todo_submit_bloc.dart';

class EditTodoListener extends StatelessWidget {
  final Widget child;

  const EditTodoListener({
    required this.child,
    super.key,
  });

  void _editTodoInitStateListener(BuildContext context, EditTodoInitState state) {
    final formBloc = context.read<EditTodoFormBloc>();

    if (state.isData) {
      formBloc.add(EditTodoFormEvent.update(state.todo!));
    }

    if (state.isError) {
      // TODO: Implement Handler
    }
  }

  void _editTodoFormStateListener(BuildContext context, EditTodoFormState state) {}

  void _editTodoSubmitStateListener(BuildContext context, EditTodoSubmitState state) {
    if (state.isSuccess) {
      context.pop();
    }

    if (state.isError) {
      // TODO: Implement Handler
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EditTodoInitBloc, EditTodoInitState>(
          listener: _editTodoInitStateListener,
        ),
        BlocListener<EditTodoFormBloc, EditTodoFormState>(
          listener: _editTodoFormStateListener,
        ),
        BlocListener<EditTodoSubmitBloc, EditTodoSubmitState>(
          listener: _editTodoSubmitStateListener,
        ),
      ],
      child: child,
    );
  }
}
