import 'package:dartz/dartz.dart';
import 'package:recharge_app/features/recharge/domain/repositories/recharge_repository.dart';

import '../../../login/data/models/error_model.dart';
import '../../data/model/benificiary/beneficiary_model.dart';

class GetBeneficiariesUseCase {
  final RechargeRepository rechargeRepository;

  GetBeneficiariesUseCase({required this.rechargeRepository});

Either<ErrorModel, List<BeneficiaryModel>> execute() {
  return rechargeRepository.getBeneficiaries();
}


}