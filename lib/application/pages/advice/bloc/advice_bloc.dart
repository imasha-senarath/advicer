import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/failures/failures.dart';

part 'advice_event.dart';

part 'advice_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, cache failed. Please try again!';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    final AdviceUseCases adviceUseCases = AdviceUseCases();

    String mapFailureToMessage(Failure failure){
      print(failure.toString());
      switch (failure.runtimeType) {
        case ServerFailure _:
        return serverFailureMessage;
        case CacheFailure _:
        return cacheFailureMessage;
        default:
          return generalFailureMessage;
      }
    }

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());

      final failureOrAdvice = await adviceUseCases.getAdvice();
      failureOrAdvice.fold(
          (failure) => emit(AdviceStateError(message: mapFailureToMessage(failure))),
          (advice) => emit(AdviceStateLoaded(advice: advice.advice)));
    });
  }
}
