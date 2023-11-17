// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      name: fields[1] as String,
      groupId: fields[2] as int,
      groupName: fields[3] as String,
      goodName: fields[4] as String,
      typeName: fields[5] as String,
      brandName: fields[6] as String,
      barcode: fields[7] as String,
      expireDate: fields[8] as String,
      fullGoodName: fields[9] as String,
      result: fields[10] as num?,
      unitName: fields[11] as String,
      quantity: fields[12] as num,
      discount: fields[14] as num,
      quantityToSold: fields[13] as num,
      priceToSold: fields[15] as num?,
      isSelected: fields[16] as bool?,
      uuid: fields[17] as String?,
      brandId: fields[19] as int,
      forSale: fields[21] as String,
      priceApproved: fields[23] as bool,
      salePrice: fields[22] as num?,
      typeId: fields[18] as int,
      unitId: fields[20] as int,
      goodInvDetId: fields[24] as int?,
      discountedSum: fields[25] as num?,
      discountDescription: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.groupId)
      ..writeByte(3)
      ..write(obj.groupName)
      ..writeByte(4)
      ..write(obj.goodName)
      ..writeByte(5)
      ..write(obj.typeName)
      ..writeByte(6)
      ..write(obj.brandName)
      ..writeByte(7)
      ..write(obj.barcode)
      ..writeByte(8)
      ..write(obj.expireDate)
      ..writeByte(9)
      ..write(obj.fullGoodName)
      ..writeByte(10)
      ..write(obj.result)
      ..writeByte(11)
      ..write(obj.unitName)
      ..writeByte(12)
      ..write(obj.quantity)
      ..writeByte(13)
      ..write(obj.quantityToSold)
      ..writeByte(14)
      ..write(obj.discount)
      ..writeByte(15)
      ..write(obj.priceToSold)
      ..writeByte(16)
      ..write(obj.isSelected)
      ..writeByte(17)
      ..write(obj.uuid)
      ..writeByte(18)
      ..write(obj.typeId)
      ..writeByte(19)
      ..write(obj.brandId)
      ..writeByte(20)
      ..write(obj.unitId)
      ..writeByte(21)
      ..write(obj.forSale)
      ..writeByte(22)
      ..write(obj.salePrice)
      ..writeByte(23)
      ..write(obj.priceApproved)
      ..writeByte(24)
      ..write(obj.goodInvDetId)
      ..writeByte(25)
      ..write(obj.discountedSum)
      ..writeByte(26)
      ..write(obj.discountDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
