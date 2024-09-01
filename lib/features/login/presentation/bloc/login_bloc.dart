import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  LoginBloc({required this.loginUseCase}) : super( LoginState.initial()) {
    on<LoginUserEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(
        isSuccess : false,
        isLoading : true,
        error : '',
      ));

      final result = await loginUseCase.execute(isVerified: event.isVerified);

      return result.fold((error) async {
        debugPrint('l...${error.status}...${error.message}');

        emit(state.copyWith(
            isSuccess : false,
            isLoading : false,
            error : error.message));
      }, (result) async {
        debugPrint('r...${result.toString()}');

        emit(state.copyWith(
          isLoading : false,
          isSuccess : true,
          user:result,
          error : '',
        ));
      });
    });

  }
}
