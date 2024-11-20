import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {

    final AdviceUseCases adviceUseCases = AdviceUseCases();

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());

      final advice = await adviceUseCases.getAdvice();
      emit(AdviceStateLoaded(advice: advice.advice));
      //emit(AdviceStateError(message: 'error message'));
    });
  }
}