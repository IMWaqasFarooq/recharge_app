


import 'package:dartz/dartz.dart';

import '../../../login/data/models/error_model.dart';
import '../../data/model/benificiary/beneficiary_model.dart';
import '../repositories/recharge_repository.dart';

class RechargeUseCase {
  final RechargeRepository rechargeRepository;

  RechargeUseCase({required this.rechargeRepository});

  Future<Either<ErrorModel, String>> execute({required BeneficiaryModel beneficiary, required int amount})  {
    return rechargeRepository.topUpBeneficiary(
        beneficiary: beneficiary,
      amount: amount
    );
  }


}