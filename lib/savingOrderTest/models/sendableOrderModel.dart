// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';


part 'sendableOrderModel.g.dart';

@HiveType(typeId: 0)
class SendableOrderModel {
  @HiveField(0)
  final bool forConsignment;
  @HiveField(1)
  final int customerId;
  @HiveField(2)
  final int payTypeId;
  @HiveField(3)
  final String orderDate;
  @HiveField(4)
  final String creditDate;
  @HiveField(5)
  final String comment;
  @HiveField(6)
  final List<SendableProductModel> dets;
  @HiveField(7)
  final num orderSum;
  @HiveField(8)
  final num orderSumWithDiscount;

  SendableOrderModel({
    required this.forConsignment,
    required this.customerId,
    required this.payTypeId,
    required this.orderDate,
    required this.creditDate,
    required this.comment,
    required this.dets,
    required this.orderSum,
    required this.orderSumWithDiscount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'forConsignment': forConsignment,
      'customerId': customerId,
      'payTypeId': payTypeId,
      'orderDate': orderDate,
      'creditDate': creditDate,
      'comment': comment,
      'dets': dets.map((x) => x.toMap()).toList(),
      'orderSum': orderSum,
      'orderSumWithDiscount': orderSumWithDiscount,
    };
  }

  factory SendableOrderModel.fromMap(Map<String, dynamic> map) {
    return SendableOrderModel(
      forConsignment: map['forConsignment'] as bool,
      customerId: map['customerId'] as int,
      payTypeId: map['payTypeId'] as int,
      orderDate: map['orderDate'] as String,
      creditDate: map['creditDate'] as String,
      comment: map['comment'] as String,
      // dets: List<SendableProductModel>.from((map['dets'] as List<dynamic>).map<SendableProductModel>((x) => SendableProductModel.fromMap(x as Map<String,dynamic>),),),
      dets: [],
      orderSum: map['orderSum'] as num,
      orderSumWithDiscount: map['orderSumWithDiscount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  // factory SendableOrderModel.fromJson(dynamic source) =>
  //     SendableOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

    static SendableOrderModel fromJson(json) => SendableOrderModel(
      forConsignment: json['forConsignment'] ?? false,
      customerId: json['customerId'] ?? 0,
      payTypeId: json['payTypeId'] ?? 0,
      orderDate: json['orderDate'] ?? DateTime(0).toString(),
      creditDate: json['creditDate'] ?? DateTime(0).toString(),
      comment: json['comment'] ?? '',
      dets:  List<SendableProductModel>.from(
                json["dets"].map((x) => SendableOrderModel.fromJson(x))),
      orderSum: json['orderSum'] ?? 0,
      orderSumWithDiscount:  json['orderSumWithDiscount'] ?? 0
    );
  
}

@HiveType(typeId: 1)
class SendableProductModel {
  @HiveField(9)
  final int goodId;
  @HiveField(10)
  final int goodInvDetId;
  @HiveField(11)
  final String expDate;
  @HiveField(12)
  final num quantityToSold;
  @HiveField(13)
  final num price;
  @HiveField(14)
  final int discountId;
  @HiveField(15)
  final num discountSum;
  @HiveField(16)
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

  // factory SendableProductModel.fromJson(String source) => SendableProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

      static SendableProductModel fromJson(json) => SendableProductModel(
      goodId: json['goodId'] ?? 0,
      goodInvDetId: json['goodInvDetId'] ?? 0,
      expDate: json['expDate'] ?? DateTime(0).toString(),
      quantityToSold: json['quantityToSold'] ?? 0,
      price: json['price'] ?? 0,
      discountId: json['disocuntId'] ?? 0,
      discountSum: json['discountSum'] ?? 0,
      id: json['id'] ?? 0
      );


}
