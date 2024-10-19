import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/core/errors/failures.dart';
import 'package:http/http.dart' as http;

abstract class AiPredictionDataSource {
  Future<Either<Failure, int>> getPrediction({required List<int> features});
}

class AiPredictionDataSourceImpl implements AiPredictionDataSource {
  String localHostUrl = 'http://192.168.1.7:5001';
  @override
  Future<Either<Failure, int>> getPrediction(
      {required List<int> features}) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$localHostUrl/predict"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {'features': features},
        ),
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return Right(responseBody['prediction'][0]);
      } else {
        return Left(
          ApiFailure.handleError(statusCode: response.statusCode),
        );
      }
    } on Exception catch (e) {
      if (e.toString().contains("SocketException")) {
        return Left(
          ApiFailure(message: "Check Your Internet Connection ..."),
        );
      }
      return Left(
        ApiFailure(
          message: 'Failed to get prediction because $e',
        ),
      );
    }
  }
}
