part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListState {
  final List<Todo> todos;

  const TodoListState({
    this.todos = const [],
  });

  bool get isInitial => this is TodoListState$Initial;
  bool get isLoading => this is TodoListState$Loading;
  bool get isData => this is TodoListState$Data;
  bool get isSuccess => this is TodoListState$Success;
  bool get isError => this is TodoListState$Error;

  bool get hasTodos => todos.isNotEmpty;
}

final class TodoListState$Initial extends TodoListState {
  const TodoListState$Initial({super.todos});

  factory TodoListState$Initial.fromState(TodoListState state) {
    return TodoListState$Initial(
      todos: state.todos,
    );
  }
}

final class TodoListState$Loading extends TodoListState {
  const TodoListState$Loading({super.todos});

  factory TodoListState$Loading.fromState(TodoListState state) {
    return TodoListState$Loading(
      todos: state.todos,
    );
  }
}

final class TodoListState$Data extends TodoListState {
  const TodoListState$Data({super.todos});

  factory TodoListState$Data.fromState(TodoListState state) {
    return TodoListState$Data(
      todos: state.todos,
    );
  }
}

final class TodoListState$Success extends TodoListState {
  const TodoListState$Success({super.todos});

  factory TodoListState$Success.fromState(TodoListState state) {
    return TodoListState$Success(
      todos: state.todos,
    );
  }
}

final class TodoListState$Error extends TodoListState {
  final Object error;

  const TodoListState$Error(this.error, {super.todos});

  factory TodoListState$Error.fromState(TodoListState state, Object error) {
    return TodoListState$Error(
      error,
      todos: state.todos,
    );
  }
}
