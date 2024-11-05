import 'package:go_router/go_router.dart';
import 'package:todos/shared/router/app_router_config.dart';

final class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: AppRouterConfig.rootNavigatorKey,
    routes: AppRouterConfig.routes,
    initialLocation: AppRouterConfig.initalPagePath,
    debugLogDiagnostics: true,
  );
}
