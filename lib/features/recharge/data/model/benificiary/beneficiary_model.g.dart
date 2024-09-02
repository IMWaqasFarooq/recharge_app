// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BeneficiaryModelAdapter extends TypeAdapter<BeneficiaryModel> {
  @override
  final int typeId = 0;

  @override
  BeneficiaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BeneficiaryModel(
      nickname: fields[0] as String,
      phoneNumber: fields[1] as String,
      totalRechargeThisMonth: fields[2] as int,
      lastRechargeDate: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BeneficiaryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nickname)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.totalRechargeThisMonth)
      ..writeByte(3)
      ..write(obj.lastRechargeDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeneficiaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
