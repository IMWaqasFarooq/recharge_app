

import 'package:recharge_app/features/recharge/domain/entity/beneficiary.dart';

abstract class RechargeLocalDataSource {

  Future<void>  addBeneficiary({ required Beneficiary beneficiary});
  List<Beneficiary> getBeneficiaries();

}
