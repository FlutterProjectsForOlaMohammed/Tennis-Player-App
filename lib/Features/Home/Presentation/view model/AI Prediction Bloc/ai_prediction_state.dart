part of 'ai_prediction_bloc.dart';

sealed class AiPredictionState extends Equatable {
  const AiPredictionState();

  @override
  List<Object> get props => [];
}

final class AiPredictionInitial extends AiPredictionState {}

final class AiPredictionSuccess extends AiPredictionState {
  final int prediction;

  const AiPredictionSuccess({required this.prediction});
}

final class AiPredictionLoading extends AiPredictionState {}

final class AiPredictionFailure extends AiPredictionState {
  final String message;

  const AiPredictionFailure({required this.message});
}
