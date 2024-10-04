import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Home/data/models/weather_model/weather_model.dart';
import 'package:tennis_player_app/core/errors/failures.dart';
import 'package:http/http.dart' as http;

abstract class GetWeatherDataSource {
  Future<Either<Failure, WeatherModel>> getWeatherData(
      {required String location});
}

class GetForcastWeather implements GetWeatherDataSource {
  String apiKey = '929dbcd01f834a9690015706232907';
  String endPoint = 'v1/forecast.json';
  String baseUrl = 'http://api.weatherapi.com';
  @override
  Future<Either<Failure, WeatherModel>> getWeatherData(
      {required String location}) async {
    http.Response response = await http.get(
      Uri.parse(
          "$baseUrl/$endPoint?key=$apiKey&q=${location.trim().toLowerCase()}&days=5&aqi=no&alerts=no"),
    );
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        WeatherModel weather = WeatherModel.fromMap(responseBody);
        return Right(weather);
      } else {
        return Left(
          ApiFailure.handleError(statusCode: response.statusCode),
        );
      }
    } on Exception catch (e) {
      if (e.toString().contains("SocketException")) {
        return Left(ApiFailure(message: "Check Your Internet Connection ..."));
      }
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
