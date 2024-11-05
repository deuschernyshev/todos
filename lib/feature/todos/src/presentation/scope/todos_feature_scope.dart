import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/feature/todos/src/data/datasources/todo_datasource_mock.dart';
import 'package:todos/feature/todos/src/data/repositories/todo_repo_impl.dart';
import 'package:todos/feature/todos/src/domain/repositories/todo_repo.dart';

class TodosFeatureScope extends StatelessWidget {
  final Widget child;

  const TodosFeatureScope({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TodoRepo>(
          create: (context) => const TodoRepoImpl(
            TodoDatasourceMock(),
          ),
        ),
      ],
      child: child,
    );
  }
}
