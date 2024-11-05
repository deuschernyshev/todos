import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos/feature/todos/src/domain/entities/todo.dart';
import 'package:todos/feature/todos/src/domain/usecases/get_todos.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final GetTodos getTodos;

  TodoListBloc({
    required this.getTodos,
  }) : super(const TodoListState$Initial()) {
    on<TodoListEvent>(
      (event, emit) => switch (event) {
        final _Init event => _onInit(event, emit),
      },
    );
  }

  TodoListState get _loadingState => TodoListState$Loading.fromState(state);

  Future<void> _onInit(_Init event, Emitter<TodoListState> emit) async {
    emit(_loadingState);

    try {
      final todos = await getTodos.getTodos();

      emit(TodoListState$Data(
        todos: todos,
      ));
    } on Object catch (error) {
      emit(TodoListState$Error.fromState(state, error));
    }
  }
}
