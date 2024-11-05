import 'package:flutter/material.dart';
import 'package:todos/feature/todos/todos.dart';

class AppScope extends StatelessWidget {
  final Widget child;

  const AppScope({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TodosFeatureScope(
      child: child,
    );
  }
}
