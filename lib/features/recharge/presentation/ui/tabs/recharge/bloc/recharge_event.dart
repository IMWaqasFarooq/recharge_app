part of 'recharge_bloc.dart';

@immutable
abstract class RechargeEvent {}

class AddBeneficiaryEvent extends RechargeEvent{
  final Beneficiary beneficiary;

  AddBeneficiaryEvent({
    required this.beneficiary,
  });
}

class GetBeneficiariesEvent extends RechargeEvent{

  GetBeneficiariesEvent();
}
