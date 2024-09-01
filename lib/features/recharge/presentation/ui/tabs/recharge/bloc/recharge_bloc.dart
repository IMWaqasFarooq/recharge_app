import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entity/beneficiary.dart';
import '../../../../../domain/use_cases/add_beneficiary_use_case.dart';
import '../../../../../domain/use_cases/get_beneficiaries_use_case.dart';
import '../../../../../domain/use_cases/recharge_use_case.dart';

part 'recharge_event.dart';
part 'recharge_state.dart';
part 'recharge_bloc.freezed.dart';

class RechargeBloc extends Bloc<RechargeEvent, RechargeState> {
  RechargeUseCase rechargeUseCase;
  AddBeneficiaryUseCase addBeneficiaryUseCase;
  GetBeneficiariesUseCase getBeneficiariesUseCase;
  RechargeBloc({
    required this.rechargeUseCase,
    required this.getBeneficiariesUseCase,
    required this.addBeneficiaryUseCase
  }) : super( RechargeState.initial()) {

    on<AddBeneficiaryEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(
        beneficiarySuccess : '',
        isLoading : true,
        beneficiaryError : '',
      ));

      final result = await addBeneficiaryUseCase.execute(beneficiary: event.beneficiary);

      List<Beneficiary> beneficiariesList = state.beneficiariesList??[];
      final list = getBeneficiariesUseCase.execute();



      list.fold((l) => '', (r) => beneficiariesList =r);


      return result.fold((error) async {
        debugPrint('l...${error.status}...${error.message}');

        emit(state.copyWith(
            beneficiarySuccess : '',
            isLoading : false,
            beneficiaryError : error.message));
      }, (result) async {
        debugPrint('r...${result.toString()}');

        emit(state.copyWith(
          isLoading : false,
          beneficiarySuccess : result,
          beneficiariesList: beneficiariesList,
          beneficiaryError : '',
        ));
      });
    });

    on<GetBeneficiariesEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(
        beneficiarySuccess : '',
        isLoading : true,
        beneficiaryError : '',
      ));

      final result = getBeneficiariesUseCase.execute();

      return result.fold((error) async {
        debugPrint('l...${error.status}...${error.message}');

        emit(state.copyWith(
            isLoading : false,
            beneficiariesList :[]
        ));
      }, (result) async {
        debugPrint('r...${result.toString()}');

        emit(state.copyWith(
          isLoading : false,
          beneficiariesList : result,
        ));
      });
    });


  }
}
