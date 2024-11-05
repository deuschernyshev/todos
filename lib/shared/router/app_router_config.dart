import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todos/feature/home/home.dart';
import 'package:todos/feature/todos/todos.dart';

final class AppRouterConfig {
  const AppRouterConfig._();

  static List<RouteBase> get routes => UnmodifiableListView(_routes);
  static String get initalPagePath => TodoListScreen.path;

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final mainShellNavigatorKey = GlobalKey<NavigatorState>();

  static final todosShellNavigatorKey = GlobalKey<NavigatorState>();

  static final List<RouteBase> _routes = [
    ShellRoute(
      parentNavigatorKey: rootNavigatorKey,
      navigatorKey: mainShellNavigatorKey,
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          path: TodoListScreen.path,
          name: TodoListScreen.name,
          parentNavigatorKey: mainShellNavigatorKey,
          builder: (context, state) => const TodoListScreen(),
          routes: [
            GoRoute(
              path: EditTodoScreen.path,
              name: EditTodoScreen.name,
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) => EditTodoScreen(
                todoId: state.extra as String?,
              ),
            ),
          ],
        ),

        // GoRoute(
        //   path: CalendarScreen.path,
        //   name: CalendarScreen.name,
        //   parentNavigatorKey: mainShellNavigatorKey,
        //   builder: (context, state) => const CalendarScreen(),
        // ),
        // GoRoute(
        //   path: SettingsScreen.path,
        //   name: SettingsScreen.name,
        //   parentNavigatorKey: mainShellNavigatorKey,
        //   builder: (context, state) => const SettingsScreen(),
        // ),
        // GoRoute(
        //   path: ProfileScreen.path,
        //   name: ProfileScreen.name,
        //   parentNavigatorKey: mainShellNavigatorKey,
        //   builder: (context, state) => const ProfileScreen(),
        // ),
      ],
    ),
  ];
}
