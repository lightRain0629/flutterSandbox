import 'package:hive/hive.dart';
import 'dart:convert';

part 'orderModel.g.dart';

@HiveType(typeId: 3)
class OrderModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String orderDate;
  @HiveField(2)
  Customer customer;
  @HiveField(3)
  Agent agent;
  @HiveField(4)
  PaymentType paymentType;
  @HiveField(5)
  String status;
  @HiveField(6)
  Agent modifiedBy;
  @HiveField(7)
  String createdDate;
  @HiveField(8)
  String updatedDate;
  @HiveField(9)
  String orderNo;
  @HiveField(10)
  num orderSum;
  @HiveField(11)
  num orderSumWithDiscount;
  @HiveField(12)
  bool forConsignment;
  @HiveField(13)
  String creditDate;

  OrderModel(
      {required this.id,
      required this.orderDate,
      required this.customer,
      required this.agent,
      required this.paymentType,
      required this.status,
      required this.modifiedBy,
      required this.createdDate,
      required this.updatedDate,
      required this.orderSum,
      required this.orderNo,
      required this.orderSumWithDiscount,
      required this.forConsignment,
      required this.creditDate,
      });

  factory OrderModel.fromJson(json) => OrderModel(
        orderSum: json['orderSum'] ?? -1,
        orderSumWithDiscount: json['orderSumWithDiscount'] ?? -1,
        id: json["id"] ?? -1,
        orderDate: json["orderDate"] ?? '',
        customer: Customer.fromJson(json["customer"] ??
            {"id": 0, "name": "", "city": "", "district": "", "adress": ""}),
        agent: Agent.fromJson(json["agent"] ?? {"id": 0, "fullName": ""}),
        paymentType: PaymentType.fromJson(
            json["paymentType"] ?? {"id": -1, "name": "null"}),
        status:
            json["status"] ?? 'null',  
        modifiedBy:
            Agent.fromJson(json["modifiedBy"] ?? {"id": 0, "fullName": "null"}),
        createdDate: json["createdDate"] ?? 'null',
        updatedDate: json["updatedDate"] ?? 'null',
        orderNo: json['orderNo'] ?? 'null',
        forConsignment: json['forConsignment'] ?? false,
        creditDate: json['creditToDate'] ?? 'null'
      );
}

@HiveType(typeId: 4)
class Agent {
  @HiveField(14)
  int id;
  @HiveField(15)
  String fullName;

  Agent({
    required this.id,
    required this.fullName,
  });

  factory Agent.fromRawJson(String str) => Agent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json["id"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
      };
}

@HiveType(typeId: 5)
class Customer {
  @HiveField(16)
  int id;
  @HiveField(17)
  String name;
  @HiveField(18)
  String city;
  @HiveField(19)
  String district;
  @HiveField(20)
  String adress;
  @HiveField(21)
  String contactNumber;

  Customer({
    required this.id,
    required this.name,
    required this.city,
    required this.district,
    required this.adress,
    required this.contactNumber,
  });

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        city: json["city"] ?? '',
        district: json["district"] ?? '',
        adress: json["adress"] ?? '',
        contactNumber: json["contactNumber"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "district": district,
        "adress": adress,
        "contactNumber": contactNumber,
      };
}

@HiveType(typeId: 6)
class PaymentType {
  @HiveField(22)
  int id;
  @HiveField(23)
  String name;

  PaymentType({
    required this.id,
    required this.name,
  });

  factory PaymentType.fromRawJson(String str) =>
      PaymentType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
