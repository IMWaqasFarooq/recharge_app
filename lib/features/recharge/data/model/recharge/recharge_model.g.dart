// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RechargeModelAdapter extends TypeAdapter<RechargeModel> {
  @override
  final int typeId = 1;

  @override
  RechargeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RechargeModel(
      beneficiary: fields[0] as BeneficiaryModel,
      amount: fields[1] as int,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RechargeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.beneficiary)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RechargeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
