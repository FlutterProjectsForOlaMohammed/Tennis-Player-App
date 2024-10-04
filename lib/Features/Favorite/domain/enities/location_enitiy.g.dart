// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_enitiy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationEnitiyAdapter extends TypeAdapter<LocationEnitiy> {
  @override
  final int typeId = 1;

  @override
  LocationEnitiy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationEnitiy(
      location: fields[0] as String,
      lat: fields[1] as String,
      lon: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocationEnitiy obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.lat)
      ..writeByte(2)
      ..write(obj.lon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationEnitiyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
