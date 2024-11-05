part of 'edit_todo_submit_bloc.dart';

@immutable
sealed class EditTodoSubmitEvent {
  const EditTodoSubmitEvent();

  const factory EditTodoSubmitEvent.submit({required EditTodoType editTodoType, required Todo todo}) = _Submit;
  const factory EditTodoSubmitEvent.delete(Todo todo) = _Delete;
}

final class _Submit extends EditTodoSubmitEvent {
  final EditTodoType editTodoType;
  final Todo todo;

  const _Submit({
    required this.editTodoType,
    required this.todo,
  });
}

final class _Delete extends EditTodoSubmitEvent {
  final Todo todo;

  const _Delete(this.todo);
}
