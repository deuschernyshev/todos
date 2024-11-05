import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/domain/usecases/create_todo.dart';
import 'package:todos/feature/todos/src/domain/usecases/delete_todo.dart';
import 'package:todos/feature/todos/src/domain/usecases/update_todo.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/edit_todo_screen.dart';

part 'edit_todo_submit_event.dart';
part 'edit_todo_submit_state.dart';

class EditTodoSubmitBloc extends Bloc<EditTodoSubmitEvent, EditTodoSubmitState> {
  final UpdateTodo updateTodo;
  final CreateTodo createTodo;
  final DeleteTodo deleteTodo;

  EditTodoSubmitBloc({
    required this.updateTodo,
    required this.createTodo,
    required this.deleteTodo,
  }) : super(const EditTodoSubmitState$Initial()) {
    on<EditTodoSubmitEvent>(
      (event, emit) => switch (event) {
        final _Submit event => _onSubmit(event, emit),
        final _Delete event => _onDelete(event, emit),
      },
    );
  }

  EditTodoSubmitState get _loadingState => const EditTodoSubmitState$Loading();

  Future<void> _onSubmit(_Submit event, Emitter<EditTodoSubmitState> emit) async {
    emit(_loadingState);

    try {
      final editTodoType = event.editTodoType;
      final todo = event.todo;

      if (editTodoType == EditTodoType.create) {
        await createTodo.createTodo(todo);
      }

      if (editTodoType == EditTodoType.update) {
        await updateTodo.updateTodo(
          todo.copyWith(
            updatedAt: DateTime.now(),
          ),
        );
      }

      emit(const EditTodoSubmitState$Success());
    } on Object catch (err) {
      emit(EditTodoSubmitState$Error(err));
    }
  }

  Future<void> _onDelete(_Delete event, Emitter<EditTodoSubmitState> emit) async {
    emit(_loadingState);

    try {
      final todo = event.todo;

      await deleteTodo.deleteTodo(todo);

      emit(const EditTodoSubmitState$Success());
    } on Object catch (err) {
      emit(EditTodoSubmitState$Error(err));
    }
  }
}
