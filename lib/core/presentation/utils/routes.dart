import 'package:flutter/material.dart';
import 'package:order_360/features/home/presentation/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:order_360/features/restaurant_management/presentation/restaurant_management/restaurant_management_page.dart';

class Routes {
  static const String rootRoute = '/';
  static const String home = '/home';
  static const String registerMenu = '/register-menu';
  static const String registerCash = '/register-cash';
  static const String registerProducts = '/register-products';
  static const String restaurantManagement = '/restaurant-management';
}

final router = GoRouter(routes: [
  GoRoute(
      path: Routes.rootRoute,
      pageBuilder: (context, state) =>
          page(state: state, child: const RestaurantMenagementPage())),
  GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) =>
          page(state: state, child: const HomePage())),
  GoRoute(
      path: Routes.restaurantManagement,
      pageBuilder: (context, state) =>
          page(state: state, child: const RestaurantMenagementPage())),
]);

NoTransitionPage<void> page(
        {required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
