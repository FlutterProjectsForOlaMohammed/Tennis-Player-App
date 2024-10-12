import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition.dart';

class Current extends Equatable {
  final int? lastUpdatedEpoch;
  final String? lastUpdated;
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
  final num? visKm;
  final num? visMiles;
  final num? uv;
  final num? gustMph;
  final num? gustKph;

  const Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
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
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromMap(Map<String, dynamic> data) => Current(
        lastUpdatedEpoch: data['last_updated_epoch'] as int?,
        lastUpdated: data['last_updated'] as String?,
        tempC: data['temp_c'] as num?,
        tempF: (data['temp_f'] as num?),
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
        precipMm: (data['precip_mm'] as num?),
        precipIn: data['precip_in'] as num?,
        humidity: data['humidity'] as num?,
        cloud: data['cloud'] as num?,
        feelslikeC: (data['feelslike_c'] as num?),
        feelslikeF: (data['feelslike_f'] as num?),
        windchillC: (data['windchill_c'] as num?),
        windchillF: (data['windchill_f'] as num?),
        heatindexC: (data['heatindex_c'] as num?),
        heatindexF: (data['heatindex_f'] as num?),
        dewpointC: (data['dewpoint_c'] as num?),
        dewpointF: (data['dewpoint_f'] as num?),
        visKm: data['vis_km'] as num?,
        visMiles: data['vis_miles'] as num?,
        uv: data['uv'] as num?,
        gustMph: (data['gust_mph'] as num?),
        gustKph: (data['gust_kph'] as num?),
      );

  Map<String, dynamic> toMap() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
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
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Current].
  factory Current.fromJson(String data) {
    return Current.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Current] to a JSON string.
  String toJson() => json.encode(toMap());

  Current copyWith({
    int? lastUpdatedEpoch,
    String? lastUpdated,
    int? tempC,
    double? tempF,
    int? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    int? pressureMb,
    double? pressureIn,
    double? precipMm,
    int? precipIn,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    double? heatindexF,
    double? dewpointC,
    double? dewpointF,
    int? visKm,
    int? visMiles,
    int? uv,
    double? gustMph,
    double? gustKph,
  }) {
    return Current(
      lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
      lastUpdated: lastUpdated ?? this.lastUpdated,
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
      visKm: visKm ?? this.visKm,
      visMiles: visMiles ?? this.visMiles,
      uv: uv ?? this.uv,
      gustMph: gustMph ?? this.gustMph,
      gustKph: gustKph ?? this.gustKph,
    );
  }

  @override
  List<Object?> get props {
    return [
      lastUpdatedEpoch,
      lastUpdated,
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
      visKm,
      visMiles,
      uv,
      gustMph,
      gustKph,
    ];
  }
}
