// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customersModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomersModelAdapter extends TypeAdapter<CustomersModel> {
  @override
  final int typeId = 1;

  @override
  CustomersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomersModel(
      id: fields[0] as int,
      name: fields[1] as String,
      balance: fields[2] as num,
      currencyName: fields[3] as String,
      uuid: fields[4] as String,
      city: fields[5] as String,
      district: fields[6] as String,
      phoneNumber: fields[7] as String,
      customerName: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustomersModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.currencyName)
      ..writeByte(4)
      ..write(obj.uuid)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.district)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.customerName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
