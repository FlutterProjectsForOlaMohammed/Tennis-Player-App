import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/Functions/reponsive_font_size.dart';

class TodayDateContainer extends StatelessWidget {
  const TodayDateContainer({
    super.key,
    required this.day,
    required this.date,
  });
  final String day, date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Color(0xff0C4CA5),
            ),
          ),
          Text(
            date,
            style: TextStyle(
                color: const Color(0xff0C4CA5),
                fontWeight: FontWeight.w900,
                fontSize: responsiveFontSize(context, baseFontSize: 25)),
          ),
        ],
      ),
    );
  }
}
