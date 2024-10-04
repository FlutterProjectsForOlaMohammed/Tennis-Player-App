import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/another_date_container.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/today_date_container.dart';
import 'package:tennis_player_app/Features/Home/domain/enities/weather_enitiy.dart';
import 'package:intl/intl.dart';

class DaysContainer extends StatelessWidget {
  const DaysContainer({
    super.key,
    required this.daysWeather,
  });
  final List<WeatherEnitiy> daysWeather;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(22),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: List.generate(
            daysWeather.length,
            (index) {
              DateTime date = DateTime.parse(daysWeather[index].date).toLocal();
              String day = DateFormat('EEEE').format(date);
              if (index == 0) {
                return TodayDateContainer(
                  day: day.substring(0, 3),
                  date: date.day.toString(),
                );
              } else {
                return AnotherDateContainer(
                  day: day.substring(0, 3),
                  date: date.day.toString(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
