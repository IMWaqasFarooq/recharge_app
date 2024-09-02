import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recharge_app/features/recharge/data/model/benificiary/beneficiary_model.dart';

import '../../../../domain/use_cases/recharge_use_case.dart';

part 'top_up_event.dart';
part 'top_up_state.dart';
part 'top_up_bloc.freezed.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  RechargeUseCase rechargeUseCase;
  TopUpBloc({required this.rechargeUseCase}) : super( TopUpState.initial()) {

    on<SelectAmountEvent>((event, emit) {
      // TODO: implement event handler

      emit(state.copyWith(
        selectedAmount : event.amount,
      ));
    });

    on<TopUpBeneficiaryEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(
        isSuccess : false,
        isLoading : true,
        error : '',
      ));

      final result = await rechargeUseCase.execute(beneficiary: event.beneficiary,amount: event.amount);

      return result.fold((error) async {
        debugPrint('l...${error.status}...${error.message}');

        emit(state.copyWith(
            isLoading : false,
            isSuccess :false,
          error: error.message
        ));
      }, (result) async {
        debugPrint('r...${result.toString()}');

        emit(state.copyWith(
          isLoading : false,
          isSuccess : true,
          error: ''
        ));
      });
    });


  }
}
