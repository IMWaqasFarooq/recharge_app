import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'beneficiary.g.dart';


@HiveType(typeId: 0)
class Beneficiary extends Equatable{

  @HiveField(0)
  final String nickname;

  @HiveField(1)
  final String phoneNumber;

  const Beneficiary({required this.nickname, required this.phoneNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [nickname, phoneNumber];
}
