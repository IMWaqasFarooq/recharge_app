import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'beneficiary_model.g.dart';


@HiveType(typeId: 0)
class BeneficiaryModel extends HiveObject{

  @HiveField(0)
  final String nickname;

  @HiveField(1)
  final String phoneNumber;

  @HiveField(2)
  int totalRechargeThisMonth;

  @HiveField(3)
  String lastRechargeDate;


   BeneficiaryModel({
    required this.nickname,
    required this.phoneNumber,
    required this.totalRechargeThisMonth,
    required this.lastRechargeDate,
  });


}
