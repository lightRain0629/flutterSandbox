import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SendableProductModel {
  final int goodId;
  final int goodInvDetId;
  final String expDate;
  final num quantityToSold;
  final num price;
  final int discountId;
  final num discountSum;
  final int id;
  
  SendableProductModel({
    required this.goodId,
    required this.goodInvDetId,
    required this.expDate,
    required this.quantityToSold,
    required this.price,
    required this.discountId,
    required this.discountSum,
    required this.id,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'goodId': goodId,
      'goodInvDetId': goodInvDetId,
      'expDate': expDate,
      'quantityToSold': quantityToSold,
      'price': price,
      'discountId': discountId,
      'discountSum': discountSum,
      'id': id,
    };
  }

  factory SendableProductModel.fromMap(Map<String, dynamic> map) {
    return SendableProductModel(
      goodId: map['goodId'] as int,
      goodInvDetId: map['goodInvDetId'] as int,
      expDate: map['expDate'] as String,
      quantityToSold: map['quantityToSold'] as num,
      price: map['price'] as num,
      discountId: map['discountId'] as int,
      discountSum: map['discountSum'] as num,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendableProductModel.fromJson(String source) => SendableProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
