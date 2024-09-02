part of 'recharge_bloc.dart';


@freezed
class RechargeState with _$RechargeState {
  const factory RechargeState({
    bool? isLoading,
     String? beneficiaryError,beneficiarySuccess,
    List<BeneficiaryModel>? beneficiariesList,
  }) = _RechargeState;

  factory RechargeState.initial() => const RechargeState(
    isLoading: false,
    beneficiariesList : [],
    beneficiaryError: '',
    beneficiarySuccess: '',
  );
}
