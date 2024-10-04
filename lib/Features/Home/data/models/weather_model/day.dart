import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition.dart';

class Day extends Equatable {
  final num? maxtempC;
  final num? maxtempF;
  final num? mintempC;
  final num? mintempF;
  final num? avgtempC;
  final num? avgtempF;
  final num? maxwindMph;
  final num? maxwindKph;
  final num? totalprecipMm;
  final num? totalprecipIn;
  final num? totalsnowCm;
  final num? avgvisKm;
  final num? avgvisMiles;
  final num? avghumidity;
  final num? dailyWillItRain;
  final num? dailyChanceOfRain;
  final num? dailyWillItSnow;
  final num? dailyChanceOfSnow;
  final Condition? condition;
  final num? uv;

  const Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromMap(Map<String, dynamic> data) => Day(
        maxtempC: (data['maxtemp_c'] as num?),
        maxtempF: (data['maxtemp_f'] as num?),
        mintempC: (data['mintemp_c'] as num?),
        mintempF: (data['mintemp_f'] as num?),
        avgtempC: (data['avgtemp_c'] as num?),
        avgtempF: (data['avgtemp_f'] as num?),
        maxwindMph: (data['maxwind_mph'] as num?),
        maxwindKph: (data['maxwind_kph'] as num?),
        totalprecipMm: (data['totalprecip_mm'] as num?),
        totalprecipIn: (data['totalprecip_in'] as num?),
        totalsnowCm: data['totalsnow_cm'] as num?,
        avgvisKm: (data['avgvis_km'] as num?),
        avgvisMiles: data['avgvis_miles'] as num?,
        avghumidity: data['avghumidity'] as num?,
        dailyWillItRain: data['daily_will_it_rain'] as num?,
        dailyChanceOfRain: data['daily_chance_of_rain'] as num?,
        dailyWillItSnow: data['daily_will_it_snow'] as num?,
        dailyChanceOfSnow: data['daily_chance_of_snow'] as num?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        uv: data['uv'] as num?,
      );

  Map<String, dynamic> toMap() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition?.toMap(),
        'uv': uv,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Day].
  factory Day.fromJson(String data) {
    return Day.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Day] to a JSON string.
  String toJson() => json.encode(toMap());

  Day copyWith({
    double? maxtempC,
    double? maxtempF,
    double? mintempC,
    double? mintempF,
    double? avgtempC,
    double? avgtempF,
    double? maxwindMph,
    double? maxwindKph,
    double? totalprecipMm,
    double? totalprecipIn,
    int? totalsnowCm,
    double? avgvisKm,
    int? avgvisMiles,
    int? avghumidity,
    int? dailyWillItRain,
    int? dailyChanceOfRain,
    int? dailyWillItSnow,
    int? dailyChanceOfSnow,
    Condition? condition,
    int? uv,
  }) {
    return Day(
      maxtempC: maxtempC ?? this.maxtempC,
      maxtempF: maxtempF ?? this.maxtempF,
      mintempC: mintempC ?? this.mintempC,
      mintempF: mintempF ?? this.mintempF,
      avgtempC: avgtempC ?? this.avgtempC,
      avgtempF: avgtempF ?? this.avgtempF,
      maxwindMph: maxwindMph ?? this.maxwindMph,
      maxwindKph: maxwindKph ?? this.maxwindKph,
      totalprecipMm: totalprecipMm ?? this.totalprecipMm,
      totalprecipIn: totalprecipIn ?? this.totalprecipIn,
      totalsnowCm: totalsnowCm ?? this.totalsnowCm,
      avgvisKm: avgvisKm ?? this.avgvisKm,
      avgvisMiles: avgvisMiles ?? this.avgvisMiles,
      avghumidity: avghumidity ?? this.avghumidity,
      dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
      dailyChanceOfRain: dailyChanceOfRain ?? this.dailyChanceOfRain,
      dailyWillItSnow: dailyWillItSnow ?? this.dailyWillItSnow,
      dailyChanceOfSnow: dailyChanceOfSnow ?? this.dailyChanceOfSnow,
      condition: condition ?? this.condition,
      uv: uv ?? this.uv,
    );
  }

  @override
  List<Object?> get props {
    return [
      maxtempC,
      maxtempF,
      mintempC,
      mintempF,
      avgtempC,
      avgtempF,
      maxwindMph,
      maxwindKph,
      totalprecipMm,
      totalprecipIn,
      totalsnowCm,
      avgvisKm,
      avgvisMiles,
      avghumidity,
      dailyWillItRain,
      dailyChanceOfRain,
      dailyWillItSnow,
      dailyChanceOfSnow,
      condition,
      uv,
    ];
  }
}
