import 'package:flutter/widgets.dart';
import 'package:tennis_player_app/core/utils/app_assets.dart';

class GoogleMapImageContainer extends StatelessWidget {
  const GoogleMapImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.imagesGoogleMap,
          ),
        ),
      ),
    );
  }
}
