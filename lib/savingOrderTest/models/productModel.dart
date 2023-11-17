// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'productModel.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int groupId;
  @HiveField(3)
  String groupName;
  @HiveField(4)
  String goodName;
  @HiveField(5)
  String typeName;
  @HiveField(6)
  String brandName;
  @HiveField(7)
  String barcode;
  @HiveField(8)
  String expireDate;
  @HiveField(9)
  String fullGoodName;
  @HiveField(10)
  num? result;
  @HiveField(11)
  String unitName;
  @HiveField(12)
  num quantity;
  @HiveField(13)
  num quantityToSold;
  @HiveField(14)
  num discount;
  @HiveField(15)
  num? priceToSold;
  @HiveField(16)
  bool? isSelected;
  @HiveField(17)
  String? uuid;
  @HiveField(18)
  int typeId;
  @HiveField(19)
  int brandId;
  @HiveField(20)
  int unitId;
  @HiveField(21)
  String forSale;
  @HiveField(22)
  num? salePrice;
  @HiveField(23)
  bool priceApproved;
  @HiveField(24)
  int? goodInvDetId;
  @HiveField(25)
  num? discountedSum;
  @HiveField(26)
  String? discountDescription;

  ProductModel(
      {required this.id,
      required this.name,
      required this.groupId,
      required this.groupName,
      required this.goodName,
      required this.typeName,
      required this.brandName,
      required this.barcode,
      required this.expireDate,
      required this.fullGoodName,
      required this.result,
      required this.unitName,
      required this.quantity,
      this.discount = 0,
      this.quantityToSold = 0,
      this.priceToSold = 0,
      this.isSelected = false,
      this.uuid = '',
      required this.brandId,
      required this.forSale,
      required this.priceApproved,
      required this.salePrice,
      required this.typeId,
      required this.unitId,
      required this.goodInvDetId,
      this.discountedSum = -1,
      this.discountDescription = ''}) {
    // quantityToSold = quantityToSold ?? 0;
  }

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(json) => ProductModel(
        id: json["id"] ?? -1,
        name: json["name"] ?? 'name',
        groupId: json["groupId"] ?? -1,
        groupName: json["groupName"] ?? 'groupName',
        goodName: json["goodName"] ?? 'goodName',
        typeName: json["typeName"] ?? 'typeName',
        brandName: json["brandName"] ?? 'brandName',
        barcode: json["barcode"] ?? 'barcode',
        expireDate: json["expireDate"] ?? DateTime(0).toString(),
        fullGoodName: json["fullGoodName"] ?? 'fullGoodName',
        result: json["result"] ?? -1,
        unitName: json["unitName"] ?? 'unitName',
        quantity: json["quantity"] ?? -1,
        quantityToSold: json["quantityToSold"] ?? 0,
        discount: json["discount"] ?? -1,
        priceToSold: json["priceToSold"] ?? 1,
        isSelected: json["isSelected"] ?? false,
        uuid: json["uuid"] ?? '',
        priceApproved: json["priceApproved"] ?? true,
        salePrice: json["salePrice"] ?? 0.00,
        typeId: json["typeId"] ?? 0,
        unitId: json["unitId"] ?? 0,
        brandId: json["brandId"] ?? 0,
        forSale: json["forSale"] ?? 'Null',
        goodInvDetId: json["goodInvDetId"] ?? 0,
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "groupId": groupId,
  //       "groupName": groupName,
  //       "goodName": goodName,
  //       "typeName": typeName,
  //       "brandName": brandName,
  //       "barcode": barcode,
  //       "expireDate": expireDate,
  //       "fullGoodName": fullGoodName,
  //       "result": result,
  //       "unitName": unitName,
  //       "quantity": quantity,
  //       "quantityToSold": quantityToSold,
  //       "discount": discount,
  //       "priceToSold": priceToSold,
  //       "isSelected": isSelected,
  //       "uuid": uuid,
  //     };

  // ProductModel copyWith({
  //   int? id,
  //   String? name,
  //   int? groupId,
  //   String? groupName,
  //   String? goodName,
  //   String? typeName,
  //   String? brandName,
  //   String? barcode,
  //   String? expireDate,
  //   String? fullGoodName,
  //   num? result,
  //   String? unitName,
  //   num? quantity,
  //   bool? isSelected,
  //   num? quantityToSold,
  //   num? discount,
  //   num? priceToSold,
  //   String? uuid,
  // }) {
  //   return ProductModel(
  //       id: id ?? this.id,
  //       name: name ?? this.name,
  //       groupId: groupId ?? this.groupId,
  //       groupName: groupName ?? this.groupName,
  //       goodName: goodName ?? this.goodName,
  //       typeName: typeName ?? this.typeName,
  //       brandName: brandName ?? this.brandName,
  //       barcode: barcode ?? this.barcode,
  //       expireDate: expireDate ?? this.expireDate,
  //       fullGoodName: fullGoodName ?? this.fullGoodName,
  //       result: result ?? this.result,
  //       unitName: unitName ?? this.unitName,
  //       quantity: quantity ?? this.quantity,
  //       quantityToSold: quantityToSold ?? this.quantityToSold,
  //       discount: discount ?? this.discount,
  //       priceToSold: priceToSold ?? this.priceToSold,
  //       isSelected: isSelected ?? this.isSelected,
  //       uuid: uuid ?? this.uuid);
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'groupId': groupId,
  //     'groupName': groupName,
  //     'goodName': goodName,
  //     'typeName': typeName,
  //     'brandName': brandName,
  //     'barcode': barcode,
  //     'expireDate': expireDate,
  //     'fullGoodName': fullGoodName,
  //     'result': result,
  //     'unitName': unitName,
  //     'quantity': quantity,
  //     'quantityToSold': quantityToSold,
  //     'discount': discount,
  //     'priceToSold': priceToSold,
  //     'isSelected': isSelected,
  //     'uuid': uuid,
  //   };
  // }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        typeId: map['typeId'] as int,
        unitId: map['unitId'] as int,
        brandId: map['brandId'] as int,
        priceApproved: map['priceApproved'] as bool,
        salePrice: map['salePrice'] as num,
        forSale: map['forSale'] as String,
        id: map['id'] as int,
        name: map['name'] as String,
        groupId: map['groupId'] as int,
        groupName: map['groupName'] as String,
        goodName: map['goodName'] as String,
        typeName: map['typeName'] as String,
        brandName: map['brandName'] as String,
        barcode: map['barcode'] as String,
        expireDate: map['expireDate'] as String,
        fullGoodName: map['fullGoodName'] as String,
        result: map['result'] as num,
        unitName: map['unitName'] as String,
        quantity: map['quantity'] as num,
        quantityToSold:
            map['quantityToSold'] != null ? map['quantityToSold'] as num : 0,
        discount: map['discount'] != null ? map['discount'] as num : 0,
        isSelected:
            map['isSelected'] != null ? map['isSelected'] as bool : false,
        priceToSold: map['priceToSold'] != null ? map['priceToSold'] as num : 0,
        uuid: map['uuid'] != null ? map['uuid'] as String : '',
        goodInvDetId:
            map['goodInvDetId'] != null ? map['goodInvDetId'] as int : 0);
  }
}
