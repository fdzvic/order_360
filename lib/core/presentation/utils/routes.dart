import 'package:flutter/material.dart';
import 'package:order_360/features/home/presentation/home/home_page.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String rootRoute = '/';
  static const String home = '/home';
}

final router = GoRouter(routes: [
  GoRoute(
      path: Routes.rootRoute,
      pageBuilder: (context, state) =>
          page(state: state, child: const HomePage())),
]);

NoTransitionPage<void> page(
        {required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
