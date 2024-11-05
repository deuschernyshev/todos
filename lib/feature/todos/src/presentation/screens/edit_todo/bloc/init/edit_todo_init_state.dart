part of 'edit_todo_init_bloc.dart';

@immutable
sealed class EditTodoInitState {
  final Todo? todo;

  const EditTodoInitState({this.todo});

  bool get isInitial => this is EditTodoInitState$Initial;
  bool get isLoading => this is EditTodoInitState$Loading;
  bool get isData => this is EditTodoInitState$Data;
  bool get isSuccess => this is EditTodoInitState$Success;
  bool get isError => this is EditTodoInitState$Error;
}

final class EditTodoInitState$Initial extends EditTodoInitState {
  const EditTodoInitState$Initial({super.todo});

  factory EditTodoInitState$Initial.fromState(EditTodoInitState state) {
    return EditTodoInitState$Initial(
      todo: state.todo,
    );
  }
}

final class EditTodoInitState$Loading extends EditTodoInitState {
  const EditTodoInitState$Loading({super.todo});

  factory EditTodoInitState$Loading.fromState(EditTodoInitState state) {
    return EditTodoInitState$Loading(
      todo: state.todo,
    );
  }
}

final class EditTodoInitState$Data extends EditTodoInitState {
  const EditTodoInitState$Data({super.todo});

  factory EditTodoInitState$Data.fromState(EditTodoInitState state) {
    return EditTodoInitState$Data(
      todo: state.todo,
    );
  }
}

final class EditTodoInitState$Success extends EditTodoInitState {
  const EditTodoInitState$Success({super.todo});

  factory EditTodoInitState$Success.fromState(EditTodoInitState state) {
    return EditTodoInitState$Success(
      todo: state.todo,
    );
  }
}

final class EditTodoInitState$Error extends EditTodoInitState {
  final Object error;

  const EditTodoInitState$Error(this.error, {super.todo});

  factory EditTodoInitState$Error.fromState(EditTodoInitState state, Object error) {
    return EditTodoInitState$Error(
      error,
      todo: state.todo,
    );
  }
}
