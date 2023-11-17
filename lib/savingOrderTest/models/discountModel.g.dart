// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discountModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscountAdapter extends TypeAdapter<Discount> {
  @override
  final int typeId = 7;

  @override
  Discount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Discount(
      id: fields[0] as int,
      goodGroupId: fields[1] as int?,
      goodTypeId: fields[2] as int?,
      brandId: fields[3] as int?,
      gidId: fields[4] as int?,
      customerId: fields[5] as int?,
      condition: fields[6] as String?,
      discount: fields[7] as int,
      beginDate: fields[8] as String?,
      discountType: fields[9] as String,
      description: fields[10] as String,
      exceptionList: (fields[11] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Discount obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.goodGroupId)
      ..writeByte(2)
      ..write(obj.goodTypeId)
      ..writeByte(3)
      ..write(obj.brandId)
      ..writeByte(4)
      ..write(obj.gidId)
      ..writeByte(5)
      ..write(obj.customerId)
      ..writeByte(6)
      ..write(obj.condition)
      ..writeByte(7)
      ..write(obj.discount)
      ..writeByte(8)
      ..write(obj.beginDate)
      ..writeByte(9)
      ..write(obj.discountType)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.exceptionList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
