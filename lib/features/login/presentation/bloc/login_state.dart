part of 'login_bloc.dart';


@freezed
class LoginState with _$LoginState {
  const factory LoginState({
     bool? isSuccess,
    bool? isLoading,
     String? error,
    UserEntity? user,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
    isSuccess: false,
    isLoading: false,
    error: '',
    user: null,
  );
}
