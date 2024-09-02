

import 'package:recharge_app/features/recharge/data/model/benificiary/beneficiary_model.dart';
import 'package:recharge_app/features/recharge/data/model/recharge/recharge_model.dart';

abstract class RechargeLocalDataSource {

  Future<void>  addBeneficiary({ required BeneficiaryModel beneficiary});
  List<BeneficiaryModel> getBeneficiaries();

  Future<void> addRechargeHistory({required RechargeModel rechargeHistory});
  List<RechargeModel> getRechargeHistory();

}
