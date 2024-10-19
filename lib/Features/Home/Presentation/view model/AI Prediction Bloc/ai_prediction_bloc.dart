import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_ai_prediction_use_case.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

part 'ai_prediction_event.dart';
part 'ai_prediction_state.dart';

class AiPredictionBloc extends Bloc<AiPredictionEvent, AiPredictionState> {
  final GetAiPredictionUseCase aiPredictionUseCase;
  AiPredictionBloc(this.aiPredictionUseCase) : super(AiPredictionInitial()) {
    on<AiPredictionEvent>((event, emit) async {
      if (event is GetPredictionEvent) {
        emit(
          AiPredictionLoading(),
        );
        Either<Failure, int> response =
            await aiPredictionUseCase.predict(event.weatherEnitiy);
        return response.fold((failure) {
          emit(
            AiPredictionFailure(message: failure.message),
          );
        }, (success) {
          emit(
            AiPredictionSuccess(
              prediction: success,
            ),
          );
        });
      }
    });
  }
}
