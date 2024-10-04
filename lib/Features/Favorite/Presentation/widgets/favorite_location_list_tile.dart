import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/widgets/favorite_location_list_tile_actions.dart';
import 'package:tennis_player_app/core/Functions/reponsive_font_size.dart';
import 'package:tennis_player_app/core/utils/app_colors.dart';

class FavLocationListTile extends StatelessWidget {
  const FavLocationListTile({
    super.key,
    required this.cityName,
    required this.lat,
    required this.lon,
  });
  final String cityName, lat, lon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white.withOpacity(0.35)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          cityName,
          style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: responsiveFontSize(context, baseFontSize: 20),
              fontWeight: FontWeight.w600),
        ),
        leading: const Icon(Icons.location_on_outlined),
        trailing: FavoriteLocationListTileActions(
            cityName: cityName, lat: lat, lon: lon),
      ),
    );
  }
}
