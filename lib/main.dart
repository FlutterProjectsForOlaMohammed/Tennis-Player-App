import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Splash/presentation/views/splash_view.dart';

void main() {
  runApp(const TennisPlayerApp());
}

class TennisPlayerApp extends StatelessWidget {
  const TennisPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tennis Player App",
      home: SplashView(),
    );
  }
}
