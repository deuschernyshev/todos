import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/form/edit_todo_form_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/init/edit_todo_init_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/submit/edit_todo_submit_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/edit_todo_screen.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/widgets/components/edit_form.dart';

class EditTodoLayout extends StatefulWidget {
  final EditTodoType editTodoType;

  const EditTodoLayout({
    required this.editTodoType,
    super.key,
  });

  @override
  State<EditTodoLayout> createState() => _EditTodoLayoutState();
}

class _EditTodoLayoutState extends State<EditTodoLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editTodoType.title),
        actions: [
          if (widget.editTodoType == EditTodoType.update)
            IconButton(
              onPressed: _onDelete,
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.red,
              ),
            ),
        ],
      ),
      body: BlocBuilder<EditTodoInitBloc, EditTodoInitState>(
        builder: (context, initState) {
          if (initState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return BlocBuilder<EditTodoSubmitBloc, EditTodoSubmitState>(
            builder: (context, submitState) {
              if (submitState.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              
              return EditForm(
                editTodoType: widget.editTodoType,
              );
            },
          );
        },
      ),
    );
  }

  void _onDelete() {
    final submitBloc = context.read<EditTodoSubmitBloc>();
    final todo = context.read<EditTodoFormBloc>().state.todo;

    submitBloc.add(EditTodoSubmitEvent.delete(todo!));
  }
}
