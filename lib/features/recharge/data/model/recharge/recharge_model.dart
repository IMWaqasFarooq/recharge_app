import 'package:hive/hive.dart';

import '../benificiary/beneficiary_model.dart';

part 'recharge_model.g.dart';

@HiveType(typeId: 1)
class RechargeModel extends HiveObject {
  @HiveField(0)
  BeneficiaryModel beneficiary;

  @HiveField(1)
  int amount;

  @HiveField(2)
  DateTime date;

  RechargeModel({
    required this.beneficiary,
    required this.amount,
    required this.date,
  });
}