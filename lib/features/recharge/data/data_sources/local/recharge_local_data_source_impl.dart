
import 'package:hive/hive.dart';
import 'package:recharge_app/features/recharge/data/model/recharge/recharge_model.dart';

import '../../../../../core/services/hive/box_constants.dart';
import '../../model/benificiary/beneficiary_model.dart';
import 'recharge_local_data_source.dart';

class RechargeLocalDataSourceImpl extends RechargeLocalDataSource {

  RechargeLocalDataSourceImpl();

  @override
  Future<void> addBeneficiary({required BeneficiaryModel beneficiary}) async {
    // TODO: implement addBeneficiary
    final box =  Hive.box<BeneficiaryModel>(BoxConstants.beneficiaryBox);
    await box.add(beneficiary);
  }

  @override
  List<BeneficiaryModel> getBeneficiaries() {
    // TODO: implement getBeneficiaries
    final box = Hive.box<BeneficiaryModel>(BoxConstants.beneficiaryBox);
    return box.values.toList();
  }


  @override
  Future<void> addRechargeHistory({required RechargeModel rechargeHistory}) async {
    final box = Hive.box<RechargeModel>(BoxConstants.rechargeBox);
    await box.add(rechargeHistory);
  }

  @override
  List<RechargeModel> getRechargeHistory() {
    final box = Hive.box<RechargeModel>(BoxConstants.rechargeBox);
    return box.values.toList();
  }

}
