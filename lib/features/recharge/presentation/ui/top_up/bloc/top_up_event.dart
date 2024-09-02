part of 'top_up_bloc.dart';


@immutable
abstract class TopUpEvent {}

class SelectAmountEvent extends TopUpEvent{
  final int amount;

  SelectAmountEvent({required this.amount});
}

class TopUpBeneficiaryEvent extends TopUpEvent{
  final int amount;
  final BeneficiaryModel beneficiary;

  TopUpBeneficiaryEvent({required this.amount, required this.beneficiary});
}