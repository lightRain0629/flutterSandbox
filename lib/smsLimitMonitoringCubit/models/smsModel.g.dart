// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SmsModelAdapter extends TypeAdapter<SmsModel> {
  @override
  final int typeId = 4;

  @override
  SmsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SmsModel(
      id: fields[0] as int,
      msg: fields[1] as String,
      sentDate: fields[2] as DateTime,
      phoneNumber: fields[3] as String,
      sentSlot: fields[4] as int,
      locale: fields[5] as String,
      symbols: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SmsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.msg)
      ..writeByte(2)
      ..write(obj.sentDate)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.sentSlot)
      ..writeByte(5)
      ..write(obj.locale)
      ..writeByte(6)
      ..write(obj.symbols);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
