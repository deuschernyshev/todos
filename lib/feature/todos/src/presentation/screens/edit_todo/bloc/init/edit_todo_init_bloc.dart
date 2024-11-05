import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/domain/usecases/get_todos.dart';

part 'edit_todo_init_event.dart';
part 'edit_todo_init_state.dart';

class EditTodoInitBloc extends Bloc<EditTodoInitEvent, EditTodoInitState> {
  final GetTodos getTodos;

  EditTodoInitBloc({
    required this.getTodos,
  }) : super(EditTodoInitState$Initial(todo: Todo.empty())) {
    on<EditTodoInitEvent>(
      (event, emit) => switch (event) {
        final _Init event => _onInit(event, emit),
      },
    );
  }

  EditTodoInitState get _loadingState => EditTodoInitState$Loading.fromState(state);

  Future<void> _onInit(_Init event, Emitter<EditTodoInitState> emit) async {
    emit(_loadingState);

    try {
      final todoId = event.todoId;

      final todo = await getTodos.getTodoById(todoId);

      emit(EditTodoInitState$Data(
        todo: todo,
      ));
    } on Object catch (error) {
      emit(EditTodoInitState$Error.fromState(state, error));
    }
  }
}
