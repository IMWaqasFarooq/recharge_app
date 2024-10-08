import 'package:dartz/dartz.dart';
import 'package:recharge_app/features/recharge/domain/repositories/recharge_repository.dart';

import '../../../login/data/models/error_model.dart';
import '../../data/model/benificiary/beneficiary_model.dart';

class AddBeneficiaryUseCase {
  final RechargeRepository rechargeRepository;

  AddBeneficiaryUseCase({required this.rechargeRepository});

Future<Either<ErrorModel, String>> execute({
  required BeneficiaryModel beneficiary}) {
  return rechargeRepository.addBeneficiary(
      beneficiary: beneficiary
  );
}


}