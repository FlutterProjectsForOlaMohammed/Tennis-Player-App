import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/grid_view_item_title.dart';
import 'package:tennis_player_app/core/Functions/reponsive_font_size.dart';

class CityWeatherItem extends StatelessWidget {
  const CityWeatherItem({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridViewItemTitle(title: title),
            const SizedBox(
              height: 12,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                style: TextStyle(
                  fontSize: responsiveFontSize(context, baseFontSize: 24),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
