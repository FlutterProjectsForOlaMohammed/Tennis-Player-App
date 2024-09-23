import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/utils/app_colors.dart';
import 'package:tennis_player_app/core/utils/app_routes.dart';

void main() {
  runApp(const TennisPlayerApp());
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
