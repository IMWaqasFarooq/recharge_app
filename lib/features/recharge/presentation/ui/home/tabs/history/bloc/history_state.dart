part of 'history_bloc.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    bool? isLoading, isSuccess,
    String? error,
    List<RechargeModel>? rechargeHistory,
  }) = _HistoryState;

  factory HistoryState.initial() => const HistoryState(
    isLoading: false,
    isSuccess : false,
    rechargeHistory: [],
    error: '',
  );
}