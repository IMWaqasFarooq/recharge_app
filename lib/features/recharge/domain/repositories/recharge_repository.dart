
import 'package:dartz/dartz.dart';
import 'package:recharge_app/features/login/data/models/error_model.dart';

import '../entity/beneficiary.dart';

abstract class RechargeRepository {

  Future<Either<ErrorModel, String>> addBeneficiary({ required Beneficiary beneficiary});
  Either<ErrorModel,List<Beneficiary>> getBeneficiaries();

}
