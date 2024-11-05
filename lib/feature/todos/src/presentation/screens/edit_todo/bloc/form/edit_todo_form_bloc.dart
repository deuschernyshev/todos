import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';

part 'edit_todo_form_event.dart';
part 'edit_todo_form_state.dart';

class EditTodoFormBloc extends Bloc<EditTodoFormEvent, EditTodoFormState> {
  EditTodoFormBloc() : super(EditTodoFormState$Initial(todo: Todo.empty())) {
    on<EditTodoFormEvent>(
      (event, emit) => switch (event) {
        final _UpdateForm event => _onUpdate(event, emit),
      },
    );
  }

  void _onUpdate(_UpdateForm event, Emitter<EditTodoFormState> emit) {
    final todo = event.todo;

    emit(
      EditTodoFormState$Data(todo: todo),
    );
  }
}
