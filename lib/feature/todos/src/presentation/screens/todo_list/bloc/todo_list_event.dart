part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListEvent {
  const TodoListEvent();

  const factory TodoListEvent.init() = _Init;
}

final class _Init extends TodoListEvent {
  const _Init();
}
