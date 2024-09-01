// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BeneficiaryAdapter extends TypeAdapter<Beneficiary> {
  @override
  final int typeId = 0;

  @override
  Beneficiary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Beneficiary(
      nickname: fields[0] as String,
      phoneNumber: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Beneficiary obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nickname)
      ..writeByte(1)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeneficiaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
