import 'package:tennis_player_app/Features/Home/data/models/weather_model/weather_model.dart';

class WeatherEnitiy {
  final String cityName, country, lat, lon, date, dayStatus, icon;
  final num maxtempC, mintempC, avgtempC, maxwindKPH, avghumidity, isRainy;

  WeatherEnitiy({
    required this.cityName,
    required this.country,
    required this.lat,
    required this.lon,
    required this.date,
    required this.dayStatus,
    required this.icon,
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.maxwindKPH,
    required this.avghumidity,
    required this.isRainy,
  });

  static List<WeatherEnitiy> convertToWeatherEnitiy(WeatherModel weather) {
    List<WeatherEnitiy> days = [];
    for (int i = 0; i < weather.forecast!.forecastday!.length; i++) {
      days.add(
        WeatherEnitiy(
          cityName: weather.location!.name!,
          country: weather.location!.country!,
          lat: weather.location!.lat!.toString(),
          lon: weather.location!.lon!.toString(),
          date: weather.forecast!.forecastday![i].date!.toString(),
          dayStatus: weather.forecast!.forecastday![i].day!.condition!.text!,
          icon:
              "https:${weather.forecast!.forecastday![i].day!.condition!.icon}",
          maxtempC: weather.forecast!.forecastday![i].day!.maxtempC!,
          mintempC: weather.forecast!.forecastday![i].day!.mintempC!,
          avgtempC: weather.forecast!.forecastday![i].day!.avgtempC!,
          maxwindKPH: weather.forecast!.forecastday![i].day!.maxwindKph!,
          avghumidity: weather.forecast!.forecastday![i].day!.avghumidity!,
          isRainy: weather.forecast!.forecastday![i].day!.dailyWillItRain!,
        ),
      );
    }
    return days;
  }

  List<int> transformationtoAiModelData({required WeatherEnitiy weather}) {
    late int rainy, sunny, hot, mild, humidity;
    if ((weather.dayStatus == "Sunny" || weather.dayStatus == "Clear") &&
        weather.isRainy == 0) {
      sunny = 1;
    } else {
      sunny = 0;
    }
    hot = (weather.avgtempC >= 30) ? 1 : 0;
    mild = (weather.avgtempC >= 15 && weather.avgtempC < 30) ? 1 : 0;
    humidity = (weather.avghumidity >= 40 && weather.avghumidity <= 70) ? 1 : 0;
    rainy = weather.isRainy.toInt();
    return [rainy, sunny, hot, mild, humidity];
  }
}
