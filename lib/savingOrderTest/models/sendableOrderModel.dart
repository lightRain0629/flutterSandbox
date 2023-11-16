// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_bloc_tests/savingOrderTest/models/sendableProductModel.dart';

class SendableOrderModel {
  final bool forConsignment;
  final int customerId;
  final int payTypeId;
  final String orderDate;
  final String creditDate;
  final String comment;
  final List<SendableProductModel> dets;
  final num orderSum;
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
      dets: List<SendableProductModel>.from((map['dets'] as List<int>).map<SendableProductModel>((x) => SendableProductModel.fromMap(x as Map<String,dynamic>),),),
      orderSum: map['orderSum'] as num,
      orderSumWithDiscount: map['orderSumWithDiscount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendableOrderModel.fromJson(dynamic source) => SendableOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


 