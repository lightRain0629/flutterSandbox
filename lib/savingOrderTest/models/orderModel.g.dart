// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 3;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      id: fields[0] as int,
      orderDate: fields[1] as String,
      customer: fields[2] as Customer,
      agent: fields[3] as Agent,
      paymentType: fields[4] as PaymentType,
      status: fields[5] as String,
      modifiedBy: fields[6] as Agent,
      createdDate: fields[7] as String,
      updatedDate: fields[8] as String,
      orderSum: fields[10] as num,
      orderNo: fields[9] as String,
      orderSumWithDiscount: fields[11] as num,
      forConsignment: fields[12] as bool,
      creditDate: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.orderDate)
      ..writeByte(2)
      ..write(obj.customer)
      ..writeByte(3)
      ..write(obj.agent)
      ..writeByte(4)
      ..write(obj.paymentType)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.modifiedBy)
      ..writeByte(7)
      ..write(obj.createdDate)
      ..writeByte(8)
      ..write(obj.updatedDate)
      ..writeByte(9)
      ..write(obj.orderNo)
      ..writeByte(10)
      ..write(obj.orderSum)
      ..writeByte(11)
      ..write(obj.orderSumWithDiscount)
      ..writeByte(12)
      ..write(obj.forConsignment)
      ..writeByte(13)
      ..write(obj.creditDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AgentAdapter extends TypeAdapter<Agent> {
  @override
  final int typeId = 4;

  @override
  Agent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Agent(
      id: fields[14] as int,
      fullName: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Agent obj) {
    writer
      ..writeByte(2)
      ..writeByte(14)
      ..write(obj.id)
      ..writeByte(15)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerAdapter extends TypeAdapter<Customer> {
  @override
  final int typeId = 5;

  @override
  Customer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Customer(
      id: fields[16] as int,
      name: fields[17] as String,
      city: fields[18] as String,
      district: fields[19] as String,
      adress: fields[20] as String,
      contactNumber: fields[21] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Customer obj) {
    writer
      ..writeByte(6)
      ..writeByte(16)
      ..write(obj.id)
      ..writeByte(17)
      ..write(obj.name)
      ..writeByte(18)
      ..write(obj.city)
      ..writeByte(19)
      ..write(obj.district)
      ..writeByte(20)
      ..write(obj.adress)
      ..writeByte(21)
      ..write(obj.contactNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PaymentTypeAdapter extends TypeAdapter<PaymentType> {
  @override
  final int typeId = 6;

  @override
  PaymentType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentType(
      id: fields[22] as int,
      name: fields[23] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentType obj) {
    writer
      ..writeByte(2)
      ..writeByte(22)
      ..write(obj.id)
      ..writeByte(23)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
