import 'package:dartz/dartz.dart';
import 'package:recharge_app/features/recharge/data/model/recharge/recharge_model.dart';
import 'package:recharge_app/features/recharge/domain/repositories/recharge_repository.dart';

import '../../../login/data/models/error_model.dart';
import '../../data/model/benificiary/beneficiary_model.dart';

class RechargeHistoryUseCase {
  final RechargeRepository rechargeRepository;

  RechargeHistoryUseCase({required this.rechargeRepository});

Either<ErrorModel, List<RechargeModel>> execute() {
  return rechargeRepository.getRechargeHistory();
}


}