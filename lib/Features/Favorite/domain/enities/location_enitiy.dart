import 'package:hive/hive.dart';

part 'location_enitiy.g.dart';

@HiveType(typeId: 1)
class LocationEnitiy {
  @HiveField(0)
  final String location;
  @HiveField(1)
  final String lat;
  @HiveField(2)
  final String lon;

  LocationEnitiy({
    required this.location,
    required this.lat,
    required this.lon,
  });
}
