import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todos/feature/todos/src/presentation/screens/edit_todo/edit_todo_screen.dart';
import 'package:todos/feature/todos/src/presentation/screens/todo_list/bloc/todo_list_bloc.dart';
import 'package:todos/feature/todos/src/presentation/screens/todo_list/widgets/components/todo_card.dart';

class TodoListLayout extends StatelessWidget {
  const TodoListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!state.hasTodos) {
            return const Center(
              child: Text('There are no Todos yet :('),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];

              return TodoCard(
                todo: todo,
                onPressed: () => _navigateToEditTodoScreen(context, id: todo.id),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToEditTodoScreen(context),
        label: const Text('Add Todo'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _navigateToEditTodoScreen(BuildContext context, {String? id}) async {
    await context.pushNamed(EditTodoScreen.name, extra: id);

    if (!context.mounted) return;

    context.read<TodoListBloc>().add(const TodoListEvent.init());
  }
}
