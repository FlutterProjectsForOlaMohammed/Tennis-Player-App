import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/core/di/service_locator.dart';
import 'package:tennis_player_app/core/observer/bloc_obsercer.dart';
import 'package:tennis_player_app/core/utils/app_colors.dart';
import 'package:tennis_player_app/core/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  Bloc.observer = SimpleBlocObserver();

  runApp(
    const TennisPlayerApp(),
  );
}

class TennisPlayerApp extends StatelessWidget {
  const TennisPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.kPrimaryColor,
      ),
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      title: "Tennis Player App",
    );
  }
}
