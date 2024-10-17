part of 'ai_prediction_bloc.dart';

sealed class AiPredictionEvent extends Equatable {
  const AiPredictionEvent();

  @override
  List<Object> get props => [];
}

class GetPredictionEvent extends AiPredictionEvent {
  final WeatherEnitiy weatherEnitiy;

  const GetPredictionEvent({required this.weatherEnitiy});
}
