
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recharge_app/features/recharge/data/model/benificiary/beneficiary_model.dart';
import 'package:recharge_app/features/recharge/data/model/recharge/recharge_model.dart';
import 'box_constants.dart';

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive
          ..init(directory.path)
          ..registerAdapter(BeneficiaryModelAdapter()) //0
      ..registerAdapter(RechargeModelAdapter()) //1


        ;

    await openBoxes();
  }

  Future<void> openBoxes() async {
    await Hive.openBox<BeneficiaryModel>(BoxConstants.beneficiaryBox);
    await Hive.openBox<RechargeModel>(BoxConstants.rechargeBox);


  }

  Future<void> clearBoxes() async {
    await Hive.box<BeneficiaryModel>(BoxConstants.beneficiaryBox).clear();
    await Hive.box<RechargeModel>(BoxConstants.rechargeBox).clear();

  }
}
