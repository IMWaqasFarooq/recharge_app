
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:recharge_app/features/recharge/domain/entity/beneficiary.dart';

import '../../../../../core/services/hive/box_constants.dart';
import 'recharge_local_data_source.dart';

class RechargeLocalDataSourceImpl extends RechargeLocalDataSource {

  RechargeLocalDataSourceImpl();

  @override
  Future<void> addBeneficiary({required Beneficiary beneficiary}) async {
    // TODO: implement addBeneficiary
    final box =  Hive.box<Beneficiary>(BoxConstants.beneficiaryBox);
    await box.add(beneficiary);
  }

  @override
  List<Beneficiary> getBeneficiaries() {
    // TODO: implement getBeneficiaries
    final box = Hive.box<Beneficiary>(BoxConstants.beneficiaryBox);
    return box.values.toList();
  }

}
