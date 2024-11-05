part of 'edit_todo_submit_bloc.dart';

@immutable
sealed class EditTodoSubmitState {
  const EditTodoSubmitState();

  bool get isInitial => this is EditTodoSubmitState$Initial;
  bool get isLoading => this is EditTodoSubmitState$Loading;
  bool get isData => this is EditTodoSubmitState$Data;
  bool get isSuccess => this is EditTodoSubmitState$Success;
  bool get isError => this is EditTodoSubmitState$Error;
}

final class EditTodoSubmitState$Initial extends EditTodoSubmitState {
  const EditTodoSubmitState$Initial();
}

final class EditTodoSubmitState$Loading extends EditTodoSubmitState {
  const EditTodoSubmitState$Loading();
}

final class EditTodoSubmitState$Data extends EditTodoSubmitState {
  const EditTodoSubmitState$Data();
}

final class EditTodoSubmitState$Success extends EditTodoSubmitState {
  const EditTodoSubmitState$Success();
}

final class EditTodoSubmitState$Error extends EditTodoSubmitState {
  final Object error;

  const EditTodoSubmitState$Error(this.error);
}
