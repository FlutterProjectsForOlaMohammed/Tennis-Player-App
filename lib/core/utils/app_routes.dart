import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/views/favorite_view.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/BottomNavigationBarBloc/bottom_navigation_bar_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/GetUserLocationBloc/get_user_location_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/GetWeatherBloc/get_weather_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/UserInfoBloc/get_user_info_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/views/home_view.dart';
import 'package:tennis_player_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/view/login_view.dart';
import 'package:tennis_player_app/Features/auth/presentation/view/register_view.dart';
import 'package:tennis_player_app/Features/auth/presentation/view/reset_password_view.dart';
import 'package:tennis_player_app/core/di/service_locator.dart';

class AppRoutes {
  static String loginView = "/loginView";
  static String registerView = "/registerView";
  static String resetPasswordView = "/resetPasswordView";
  static String homeView = "/homeView";
  static String favView = "/favView";

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
            child: BlocProvider(
              create: (context) => AuthBloc(
                sl(),
                sl(),
                sl(),
                sl(),
              ),
              child: const LoginView(),
            ),
          );
        },
      ),
      GoRoute(
        path: resetPasswordView,
        pageBuilder: (context, state) {
          return routingAnimation(
            state,
            child: BlocProvider(
              create: (context) => AuthBloc(
                sl(),
                sl(),
                sl(),
                sl(),
              ),
              child: const ResetPasswordView(),
            ),
          );
        },
      ),
      GoRoute(
        path: registerView,
        pageBuilder: (context, state) {
          return routingAnimation(
            state,
            child: BlocProvider(
              create: (context) => AuthBloc(
                sl(),
                sl(),
                sl(),
                sl(),
              ),
              child: const RegisterView(),
            ),
          );
        },
      ),
      GoRoute(
        path: homeView,
        pageBuilder: (context, state) {
          String email = state.extra as String;
          return routingAnimation(
            state,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => GetUserInfoBloc(
                    sl(),
                  ),
                ),
                BlocProvider(
                  create: (context) => GetWeatherBloc(
                    sl(),
                  ),
                ),
                BlocProvider(
                  create: (context) => BottomNavigationBarBloc(),
                ),
                BlocProvider(
                  create: (context) => GetUserLocationBloc(
                    sl(),
                  ),
                ),
              ],
              child: HomeView(email: email),
            ),
          );
        },
      ),
      GoRoute(
        path: favView,
        pageBuilder: (context, state) {
          return routingAnimation(
            state,
            child: BlocProvider(
              create: (context) => AuthBloc(
                sl(),
                sl(),
                sl(),
                sl(),
              ),
              child: const FavoriteView(),
            ),
          );
        },
      )
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
