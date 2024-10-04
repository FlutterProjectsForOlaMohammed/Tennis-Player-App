import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/Features/Splash/presentation/widgets/animated_tennis_ball_image.dart';
import 'package:tennis_player_app/Features/Splash/presentation/widgets/tennis_ball_image.dart';
import 'package:tennis_player_app/Features/Splash/presentation/widgets/tennis_ball_image_filpped.dart';
import 'package:tennis_player_app/core/utils/app_assets.dart';
import 'package:tennis_player_app/core/utils/app_routes.dart';
import 'package:tennis_player_app/core/utils/app_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    routeToLoginView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: splashViewBackground(),
        child: Stack(
          children: [
            const AnimatedTennisBallImage(
              isFlipped: false,
              child: TennisBallImage(),
            ),
            const AnimatedTennisBallImage(
              isFlipped: true,
              child: TennisBallImageFlipped(),
            ),
            Center(
              child: Text(
                "Tennis Player",
                style: AppStyles.style32Regular(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration splashViewBackground() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          AppAssets.imagesSplashViewBackground,
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  Future<void> routeToLoginView() async {
    await Future.delayed(const Duration(seconds: 3)).then(
      (_) async {
        await GoRouter.of(context).push(AppRoutes.loginView);
      },
    );
  }
}

Offset getStartPointForTennisImage(BuildContext context) {
  return Offset(
    MediaQuery.sizeOf(context).width / 3,
    MediaQuery.sizeOf(context).height / 2.5,
  );
}
