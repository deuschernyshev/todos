part of 'edit_todo_init_bloc.dart';

@immutable
sealed class EditTodoInitEvent {
  const EditTodoInitEvent();

  const factory EditTodoInitEvent.init(String todoId) = _Init;
}

final class _Init extends EditTodoInitEvent {
  final String todoId;

  const _Init(this.todoId);
}
