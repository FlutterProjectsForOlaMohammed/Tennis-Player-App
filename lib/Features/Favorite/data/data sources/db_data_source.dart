import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class DBDataSource {
  Future<Either<Failure, Unit>> deleteDataFromDB(
      {required LocationEnitiy location, required String email});
  Future<Either<Failure, Unit>> addDataFromDB(
      {required LocationEnitiy location, required String email});
  Future<Either<Failure, List<LocationEnitiy>>> getDataFromDB(
      {required String email});
}

class DBDataSourceImpl implements DBDataSource {
  @override
  Future<Either<Failure, Unit>> deleteDataFromDB(
      {required LocationEnitiy location, required String email}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference favLocations = firestore.collection('Fav Locations');
    try {
      QuerySnapshot doc =
          await favLocations.where('email', isEqualTo: email).get();

      String docuID = doc.docs.first.id;
      await favLocations.doc(docuID).update(
        {
          'data': FieldValue.arrayRemove(
            [
              {
                "location": location.location,
                "lat": location.lat,
                "lon": location.lon
              },
            ],
          ),
        },
      );
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(
        FirebaseFirestoreFailure.handleError(e),
      );
    } catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<LocationEnitiy>>> getDataFromDB(
      {required String email}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference favLocations = firestore.collection('Fav Locations');
    try {
      QuerySnapshot doc =
          await favLocations.where('email', isEqualTo: email).get();
      if (doc.docs.isNotEmpty) {
        Map<String, dynamic> userLocations =
            doc.docs.first.data() as Map<String, dynamic>;
        List<LocationEnitiy> locations = [];
        for (Map<String, dynamic> item in userLocations['data']) {
          locations.add(
            LocationEnitiy(
                location: item['location'], lat: item['lat'], lon: item['lon']),
          );
        }
        return Right(locations);
      } else {
        return const Right([]);
      }
    } on FirebaseException catch (e) {
      return Left(
        FirebaseFirestoreFailure.handleError(e),
      );
    } catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> addDataFromDB(
      {required LocationEnitiy location, required String email}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference favLocations = firestore.collection('Fav Locations');
    try {
      QuerySnapshot doc =
          await favLocations.where('email', isEqualTo: email).get();
      if (doc.docs.isNotEmpty) {
        await doc.docs.first.reference.update(
          {
            'data': FieldValue.arrayUnion(
              [
                {
                  "location": location.location,
                  "lat": location.lat,
                  "lon": location.lon
                },
              ],
            ),
          },
        );
        return const Right(unit);
      } else {
        await favLocations.add(
          {
            "email": email,
            "data": [
              {
                "location": location.location,
                "lat": location.lat,
                "lon": location.lon,
              }
            ],
          },
        );
        return const Right(unit);
      }
    } on FirebaseException catch (e) {
      return Left(
        FirebaseFirestoreFailure.handleError(e),
      );
    } catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
