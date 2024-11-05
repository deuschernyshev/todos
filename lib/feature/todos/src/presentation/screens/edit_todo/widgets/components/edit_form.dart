import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/form/edit_todo_form_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/bloc/submit/edit_todo_submit_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/edit_todo_screen.dart';

class EditForm extends StatefulWidget {
  final EditTodoType editTodoType;

  const EditForm({
    required this.editTodoType,
    super.key,
  });

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  late final EditTodoFormBloc _bloc;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _bloc = context.read<EditTodoFormBloc>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _updateControllers(_bloc.state);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  void _updateControllers(EditTodoFormState state) {
    _titleController.text = state.todo?.title ?? '';
    _descriptionController.text = state.todo?.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditTodoFormBloc, EditTodoFormState>(
      listener: (context, state) {
        _updateControllers(state);
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _titleController,
                              onChanged: _onUpdateTitle,
                              decoration: const InputDecoration(
                                label: Text('Title'),
                              ),
                              validator: _validateRequiredFields,
                            ),
                            TextFormField(
                              controller: _descriptionController,
                              onChanged: _onUpdateDescription,
                              decoration: const InputDecoration(
                                label: Text('Description'),
                              ),
                              validator: _validateRequiredFields,
                            ),
                            SwitchListTile.adaptive(
                              contentPadding: EdgeInsets.zero,
                              value: state.todo?.done ?? false,
                              title: const Text('Done'),
                              onChanged: _onUpdateDone,
                            ),
                            if (widget.editTodoType == EditTodoType.update) ...[
                              Text('Created At: ${state.todo!.createdAt}'),
                              Text('Updated At: ${state.todo!.updatedAt}'),
                            ]
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _onSubmit(state.todo!),
                      child: Text(widget.editTodoType.title),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onUpdateTitle(String? value) {
    final todo = _bloc.state.todo?.copyWith(
      title: value,
    );

    _bloc.add(EditTodoFormEvent.update(todo!));
  }

  void _onUpdateDescription(String? value) {
    final todo = _bloc.state.todo?.copyWith(
      description: value,
    );

    _bloc.add(EditTodoFormEvent.update(todo!));
  }

  void _onUpdateDone(bool value) {
    final todo = _bloc.state.todo?.copyWith(
      done: value,
    );

    _bloc.add(EditTodoFormEvent.update(todo!));
  }

  void _onSubmit(Todo todo) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final submitBloc = context.read<EditTodoSubmitBloc>();

    submitBloc.add(EditTodoSubmitEvent.submit(editTodoType: widget.editTodoType, todo: todo));
  }

  String? _validateRequiredFields(String? value) {
    if (value == null || value.isEmpty) return 'This field is required';

    return null;
  }
}
