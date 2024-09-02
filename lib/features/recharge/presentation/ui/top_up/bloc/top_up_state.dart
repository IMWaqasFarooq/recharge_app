part of 'top_up_bloc.dart';

@freezed
class TopUpState with _$TopUpState {
  const factory TopUpState({
    bool? isLoading, isSuccess,
    int? selectedAmount,
    String? error,
  }) = _TopUpState;

  factory TopUpState.initial() => const TopUpState(
    isLoading: false,
    isSuccess : false,
    error: '',
    selectedAmount: 5,
  );
}