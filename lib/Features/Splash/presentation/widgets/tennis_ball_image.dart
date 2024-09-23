import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/utils/app_assets.dart';

class TennisBallImage extends StatelessWidget {
  const TennisBallImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 170,
      child: Image.asset(
        AppAssets.imagesTennisImage,
      ),
    );
  }
}
