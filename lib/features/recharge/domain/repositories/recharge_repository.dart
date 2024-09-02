
import 'package:dartz/dartz.dart';
import 'package:recharge_app/features/login/data/models/error_model.dart';
import 'package:recharge_app/features/recharge/data/model/recharge/recharge_model.dart';

import '../../data/model/benificiary/beneficiary_model.dart';

abstract class RechargeRepository {

  Future<Either<ErrorModel, String>> addBeneficiary({ required BeneficiaryModel beneficiary});
  Either<ErrorModel,List<BeneficiaryModel>> getBeneficiaries();

  Future<Either<ErrorModel, String>> topUpBeneficiary({required BeneficiaryModel beneficiary, required int amount});
  Either<ErrorModel,List<RechargeModel>> getRechargeHistory();


}
