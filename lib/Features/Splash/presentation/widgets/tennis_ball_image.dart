import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/utils/app_assets.dart';

class TennisBallImage extends StatelessWidget {
  const TennisBallImage({
    super.key,
    required this.value,
  });
  final Offset value;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: value.dx,
      bottom: value.dy,
      child: SizedBox.square(
        dimension: 170,
        child: Image.asset(
          AppAssets.imagesTennisImage,
        ),
      ),
    );
  }
}
