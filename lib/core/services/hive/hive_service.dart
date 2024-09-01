
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recharge_app/features/recharge/domain/entity/beneficiary.dart';
import 'box_constants.dart';

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive
          ..init(directory.path)
          ..registerAdapter(BeneficiaryAdapter()) //0

        ;

    await openBoxes();
  }

  Future<void> openBoxes() async {
    await Hive.openBox<Beneficiary>(BoxConstants.beneficiaryBox);

  }

  Future<void> clearBoxes() async {
    await Hive.box<Beneficiary>(BoxConstants.beneficiaryBox).clear();
  }
}
