import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:tennis_player_app/Features/auth/presentation/view/login_view.dart';
import 'package:tennis_player_app/Features/auth/presentation/view/register_view.dart';

class AppRoutes {
  static String loginView = "/loginView";
  static String registerView = "/registerView";

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: loginView,
        pageBuilder: (context, state) {
          return routingAnimation(
            state,
            child: const LoginView(),
          );
        },
      ),
      GoRoute(
        path: registerView,
        pageBuilder: (context, state) {
          return routingAnimation(
            state,
            child: const RegisterView(),
          );
        },
      ),
    ],
  );

  static CustomTransitionPage<dynamic> routingAnimation(GoRouterState state,
      {required Widget child}) {
    return CustomTransitionPage(
      transitionDuration: const Duration(seconds: 1),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
