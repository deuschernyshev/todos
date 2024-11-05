part of 'edit_todo_form_bloc.dart';

@immutable
sealed class EditTodoFormEvent {
  const EditTodoFormEvent();

  const factory EditTodoFormEvent.update(Todo todo) = _UpdateForm;
}

final class _UpdateForm extends EditTodoFormEvent {
  final Todo todo;

  const _UpdateForm(this.todo);
}
