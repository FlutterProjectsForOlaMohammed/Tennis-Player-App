import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition.dart';

class Hour extends Equatable {
  final num? timeEpoch;
  final String? time;
  final num? tempC;
  final num? tempF;
  final num? isDay;
  final Condition? condition;
  final num? windMph;
  final num? windKph;
  final num? windDegree;
  final String? windDir;
  final num? pressureMb;
  final num? pressureIn;
  final num? precipMm;
  final num? precipIn;
  final num? snowCm;
  final num? humidity;
  final num? cloud;
  final num? feelslikeC;
  final num? feelslikeF;
  final num? windchillC;
  final num? windchillF;
  final num? heatindexC;
  final num? heatindexF;
  final num? dewpointC;
  final num? dewpointF;
  final num? willItRain;
  final num? chanceOfRain;
  final num? willItSnow;
  final num? chanceOfSnow;
  final num? visKm;
  final num? visMiles;
  final num? gustMph;
  final num? gustKph;
  final num? uv;

  const Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  factory Hour.fromMap(Map<String, dynamic> data) => Hour(
        timeEpoch: data['time_epoch'] as num?,
        time: data['time'] as String?,
        tempC: (data['temp_c'] as num?),
        tempF: data['temp_f'] as num?,
        isDay: data['is_day'] as num?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        windMph: (data['wind_mph'] as num?),
        windKph: (data['wind_kph'] as num?),
        windDegree: data['wind_degree'] as num?,
        windDir: data['wind_dir'] as String?,
        pressureMb: data['pressure_mb'] as num?,
        pressureIn: (data['pressure_in'] as num?),
        precipMm: data['precip_mm'] as num?,
        precipIn: data['precip_in'] as num?,
        snowCm: data['snow_cm'] as num?,
        humidity: data['humidity'] as num?,
        cloud: data['cloud'] as num?,
        feelslikeC: (data['feelslike_c'] as num?),
        feelslikeF: (data['feelslike_f'] as num?),
        windchillC: (data['windchill_c'] as num?),
        windchillF: (data['windchill_f'] as num?),
        heatindexC: (data['heatindex_c'] as num?),
        heatindexF: data['heatindex_f'] as num?,
        dewpointC: (data['dewpoint_c'] as num?),
        dewpointF: (data['dewpoint_f'] as num?),
        willItRain: data['will_it_rain'] as num?,
        chanceOfRain: data['chance_of_rain'] as num?,
        willItSnow: data['will_it_snow'] as num?,
        chanceOfSnow: data['chance_of_snow'] as num?,
        visKm: data['vis_km'] as num?,
        visMiles: data['vis_miles'] as num?,
        gustMph: (data['gust_mph'] as num?),
        gustKph: (data['gust_kph'] as num?),
        uv: data['uv'] as num?,
      );

  Map<String, dynamic> toMap() => {
        'time_epoch': timeEpoch,
        'time': time,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition?.toMap(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'snow_cm': snowCm,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'windchill_c': windchillC,
        'windchill_f': windchillF,
        'heatindex_c': heatindexC,
        'heatindex_f': heatindexF,
        'dewpoint_c': dewpointC,
        'dewpoint_f': dewpointF,
        'will_it_rain': willItRain,
        'chance_of_rain': chanceOfRain,
        'will_it_snow': willItSnow,
        'chance_of_snow': chanceOfSnow,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
        'uv': uv,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Hour].
  factory Hour.fromJson(String data) {
    return Hour.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Hour] to a JSON string.
  String toJson() => json.encode(toMap());

  Hour copyWith({
    int? timeEpoch,
    String? time,
    double? tempC,
    int? tempF,
    int? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    int? pressureMb,
    double? pressureIn,
    int? precipMm,
    int? precipIn,
    int? snowCm,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    int? heatindexF,
    double? dewpointC,
    double? dewpointF,
    int? willItRain,
    int? chanceOfRain,
    int? willItSnow,
    int? chanceOfSnow,
    int? visKm,
    int? visMiles,
    double? gustMph,
    double? gustKph,
    int? uv,
  }) {
    return Hour(
      timeEpoch: timeEpoch ?? this.timeEpoch,
      time: time ?? this.time,
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      isDay: isDay ?? this.isDay,
      condition: condition ?? this.condition,
      windMph: windMph ?? this.windMph,
      windKph: windKph ?? this.windKph,
      windDegree: windDegree ?? this.windDegree,
      windDir: windDir ?? this.windDir,
      pressureMb: pressureMb ?? this.pressureMb,
      pressureIn: pressureIn ?? this.pressureIn,
      precipMm: precipMm ?? this.precipMm,
      precipIn: precipIn ?? this.precipIn,
      snowCm: snowCm ?? this.snowCm,
      humidity: humidity ?? this.humidity,
      cloud: cloud ?? this.cloud,
      feelslikeC: feelslikeC ?? this.feelslikeC,
      feelslikeF: feelslikeF ?? this.feelslikeF,
      windchillC: windchillC ?? this.windchillC,
      windchillF: windchillF ?? this.windchillF,
      heatindexC: heatindexC ?? this.heatindexC,
      heatindexF: heatindexF ?? this.heatindexF,
      dewpointC: dewpointC ?? this.dewpointC,
      dewpointF: dewpointF ?? this.dewpointF,
      willItRain: willItRain ?? this.willItRain,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      willItSnow: willItSnow ?? this.willItSnow,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
      visKm: visKm ?? this.visKm,
      visMiles: visMiles ?? this.visMiles,
      gustMph: gustMph ?? this.gustMph,
      gustKph: gustKph ?? this.gustKph,
      uv: uv ?? this.uv,
    );
  }

  @override
  List<Object?> get props {
    return [
      timeEpoch,
      time,
      tempC,
      tempF,
      isDay,
      condition,
      windMph,
      windKph,
      windDegree,
      windDir,
      pressureMb,
      pressureIn,
      precipMm,
      precipIn,
      snowCm,
      humidity,
      cloud,
      feelslikeC,
      feelslikeF,
      windchillC,
      windchillF,
      heatindexC,
      heatindexF,
      dewpointC,
      dewpointF,
      willItRain,
      chanceOfRain,
      willItSnow,
      chanceOfSnow,
      visKm,
      visMiles,
      gustMph,
      gustKph,
      uv,
    ];
  }
}
