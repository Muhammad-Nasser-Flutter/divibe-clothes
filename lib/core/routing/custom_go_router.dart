import 'package:cloth_ecommerce/core/constants/product_constants.dart';
import 'package:cloth_ecommerce/core/widgets/loading_wrapper.dart';
import 'package:cloth_ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:cloth_ecommerce/features/main_layout/main_layout_screen.dart';
import 'package:cloth_ecommerce/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloth_ecommerce/core/routing/routes.dart';
import 'package:cloth_ecommerce/main.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.homeRoute,
  navigatorKey: navigatorKey,
  onException: (context, state, router) {
    router.go(Routes.homeRoute);
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayoutScreen(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.homeRoute,
          name: Routes.homeRoute,
          pageBuilder: (context, state) => buildAnimatedPage(const LoadingWrapper(child: HomeScreen())),
        ),
        GoRoute(
          path: Routes.productDetailsRoute,
          name: Routes.productDetailsRoute,
          pageBuilder: (context, state) {
            final productId = state.pathParameters['id'];
            final product = ProductConstants.getSampleProducts().firstWhere(
              (p) => p.id == productId,
              orElse: () => ProductConstants.getSampleProducts().first,
            );
            return buildAnimatedPage(LoadingWrapper(child: ProductDetailsScreen(product: product)));
          },
        ),
      ],
    ),
  ],
);
CustomTransitionPage buildAnimatedPage(Widget child) {
  return CustomTransitionPage(
    key: ValueKey(child.runtimeType),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
