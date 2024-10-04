import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class DBDataSource {
  Future<Either<Failure, Unit>> deleteDataFromDB(
      {required LocationEnitiy location});
  Future<Either<Failure, Unit>> addDataFromDB(
      {required LocationEnitiy location});
  Future<Either<Failure, List<LocationEnitiy>>> getDataFromDB();
}

class DBDataSourceImpl implements DBDataSource {
  final String _boxName = "LocationEnitiyBox";
  Future<Box<LocationEnitiy>> get _box async =>
      await Hive.openBox<LocationEnitiy>(_boxName);
  @override
  Future<Either<Failure, Unit>> deleteDataFromDB(
      {required LocationEnitiy location}) async {
    try {
      var box = await _box;
      var item = box.values.toList().indexWhere(
        (element) {
          return location.location == element.location;
        },
      );
      await box.deleteAt(item);
      return const Right(unit);
    } on Exception catch (_) {
      return const Left(
        UnexpectedFailure(message: "Couldn't reach DB"),
      );
    }
  }

  @override
  Future<Either<Failure, List<LocationEnitiy>>> getDataFromDB() async {
    try {
      var box = await _box;
      return Right(box.values.toList());
    } on Exception catch (_) {
      return const Left(
        UnexpectedFailure(message: "Couldn't reach DB"),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> addDataFromDB(
      {required LocationEnitiy location}) async {
    try {
      var box = await _box;
      var item = box.values.toList().indexWhere(
        (element) {
          return location.location == element.location;
        },
      );
      if (item == -1) {
        await box.add(location);
      }
      return const Right(unit);
    } on Exception catch (_) {
      return const Left(
        UnexpectedFailure(message: "Couldn't reach DB"),
      );
    }
  }
}
