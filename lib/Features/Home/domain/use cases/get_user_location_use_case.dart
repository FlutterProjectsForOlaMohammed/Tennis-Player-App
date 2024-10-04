import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tennis_player_app/Features/Home/domain/Repositories/home_repository.dart';
import 'package:tennis_player_app/core/Functions/show_message.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class GetUserLocationUseCase {
  final HomeRepository homeRepository;

  GetUserLocationUseCase({required this.homeRepository});
  Future<void> openLocationSettings() async {
    bool opened = await Geolocator.openLocationSettings();
    if (!opened) {
      showMessage(message: "Unable to open location settings");
    }
  }

  Future<bool> _checkUserPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showMessage(message: 'Location services are disabled.');
      await openLocationSettings();
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showMessage(message: 'Location permissions are denied');
        return false;
      }
      return true;
    }

    if (permission == LocationPermission.deniedForever) {
      showMessage(
          message:
              'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  Future<Either<Failure, List<double>>> getUserLocationUseCase(
      {String? location}) async {
    if (await _checkUserPermission()) {
      if (location == null) {
        return await homeRepository.getUserLocation();
      } else {
        return await homeRepository.getCoordinatesFromAddress(
            location: location);
      }
    } else {
      return const Left(
        UnexpectedFailure(message: "Something went Wrong , Please Try again"),
      );
    }
  }
}
