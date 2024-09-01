import 'package:dartz/dartz.dart';
import 'package:recharge_app/features/recharge/domain/entity/beneficiary.dart';
import 'package:recharge_app/features/recharge/domain/repositories/recharge_repository.dart';

import '../../../login/data/models/error_model.dart';

class AddBeneficiaryUseCase {
  final RechargeRepository rechargeRepository;

  AddBeneficiaryUseCase({required this.rechargeRepository});

Future<Either<ErrorModel, String>> execute({
  required Beneficiary beneficiary}) {
  return rechargeRepository.addBeneficiary(
      beneficiary: beneficiary
  );
}


}