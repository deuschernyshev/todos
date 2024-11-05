part of 'edit_todo_form_bloc.dart';

@immutable
sealed class EditTodoFormState {
  final Todo? todo;

  const EditTodoFormState({this.todo});

  bool get isInitial => this is EditTodoFormState$Initial;
  bool get isLoading => this is EditTodoFormState$Loading;
  bool get isData => this is EditTodoFormState$Data;
  bool get isSuccess => this is EditTodoFormState$Success;
  bool get isError => this is EditTodoFormState$Error;
}

final class EditTodoFormState$Initial extends EditTodoFormState {
  const EditTodoFormState$Initial({super.todo});

  factory EditTodoFormState$Initial.fromState(EditTodoFormState state) {
    return EditTodoFormState$Initial(
      todo: state.todo,
    );
  }
}

final class EditTodoFormState$Loading extends EditTodoFormState {
  const EditTodoFormState$Loading({super.todo});

  factory EditTodoFormState$Loading.fromState(EditTodoFormState state) {
    return EditTodoFormState$Loading(
      todo: state.todo,
    );
  }
}

final class EditTodoFormState$Data extends EditTodoFormState {
  const EditTodoFormState$Data({super.todo});

  factory EditTodoFormState$Data.fromState(EditTodoFormState state) {
    return EditTodoFormState$Data(
      todo: state.todo,
    );
  }
}

final class EditTodoFormState$Success extends EditTodoFormState {
  const EditTodoFormState$Success({super.todo});

  factory EditTodoFormState$Success.fromState(EditTodoFormState state) {
    return EditTodoFormState$Success(
      todo: state.todo,
    );
  }
}

final class EditTodoFormState$Error extends EditTodoFormState {
  final Object error;

  const EditTodoFormState$Error(this.error, {super.todo});

  factory EditTodoFormState$Error.fromState(EditTodoFormState state, Object error) {
    return EditTodoFormState$Error(
      error,
      todo: state.todo,
    );
  }
}
