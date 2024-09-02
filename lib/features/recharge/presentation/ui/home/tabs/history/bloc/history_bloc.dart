import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/model/recharge/recharge_model.dart';
import '../../../../../../domain/use_cases/recharge_history_use_case.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  RechargeHistoryUseCase rechargeHistoryUseCase;
  HistoryBloc({required this.rechargeHistoryUseCase}) : super( HistoryState.initial()) {
    on<GetRechargeHistoryEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(
        isSuccess : false,
        isLoading : true,
        error : '',
      ));

      final result = rechargeHistoryUseCase.execute();

      return result.fold((error) async {
        debugPrint('l...${error.status}...${error.message}');

        emit(state.copyWith(
          isSuccess :false,
            isLoading : false,
            rechargeHistory :[]
        ));
      }, (result) async {
        debugPrint('r...${result.toString()}');

        emit(state.copyWith(
          isSuccess :true,
          isLoading : false,
          rechargeHistory : result,
        ));
      });
    });

  }
}
