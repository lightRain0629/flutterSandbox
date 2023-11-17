// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sendableOrderModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SendableOrderModelAdapter extends TypeAdapter<SendableOrderModel> {
  @override
  final int typeId = 0;

  @override
  SendableOrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SendableOrderModel(
      forConsignment: fields[0] as bool,
      customerId: fields[1] as int,
      payTypeId: fields[2] as int,
      orderDate: fields[3] as String,
      creditDate: fields[4] as String,
      comment: fields[5] as String,
      dets: (fields[6] as List).cast<SendableProductModel>(),
      orderSum: fields[7] as num,
      orderSumWithDiscount: fields[8] as num,
    );
  }

  @override
  void write(BinaryWriter writer, SendableOrderModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.forConsignment)
      ..writeByte(1)
      ..write(obj.customerId)
      ..writeByte(2)
      ..write(obj.payTypeId)
      ..writeByte(3)
      ..write(obj.orderDate)
      ..writeByte(4)
      ..write(obj.creditDate)
      ..writeByte(5)
      ..write(obj.comment)
      ..writeByte(6)
      ..write(obj.dets)
      ..writeByte(7)
      ..write(obj.orderSum)
      ..writeByte(8)
      ..write(obj.orderSumWithDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SendableOrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SendableProductModelAdapter extends TypeAdapter<SendableProductModel> {
  @override
  final int typeId = 1;

  @override
  SendableProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SendableProductModel(
      goodId: fields[9] as int,
      goodInvDetId: fields[10] as int,
      expDate: fields[11] as String,
      quantityToSold: fields[12] as num,
      price: fields[13] as num,
      discountId: fields[14] as int,
      discountSum: fields[15] as num,
      id: fields[16] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SendableProductModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(9)
      ..write(obj.goodId)
      ..writeByte(10)
      ..write(obj.goodInvDetId)
      ..writeByte(11)
      ..write(obj.expDate)
      ..writeByte(12)
      ..write(obj.quantityToSold)
      ..writeByte(13)
      ..write(obj.price)
      ..writeByte(14)
      ..write(obj.discountId)
      ..writeByte(15)
      ..write(obj.discountSum)
      ..writeByte(16)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SendableProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
