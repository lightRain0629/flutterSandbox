import 'dart:convert';

import 'package:uuid/uuid.dart';

class OrderDetailModel {
  int id;
  String orderNo;
  String orderDate;
  num orderSum;
  num orderSumWithDiscount;
  String creditDate;
  Customer customer;
  Agent agent;
  PaymentType paymentType;
  bool forConsignment;
  String status;
  Agent modifiedBy;
  String createdDate;
  String updatedDate;
  List<Comment> comments;
  List<Det> dets;
  int orderType;

  OrderDetailModel({
    required this.id,
    required this.orderNo,
    required this.orderDate,
    required this.orderSum,
    required this.orderSumWithDiscount,
    required this.creditDate,
    required this.customer,
    required this.agent,
    required this.paymentType,
    required this.forConsignment,
    required this.status,
    required this.modifiedBy,
    required this.createdDate,
    required this.updatedDate,
    required this.comments,
    required this.dets,
    required this.orderType,
  });

  factory OrderDetailModel.fromRawJson(String str) =>
      OrderDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
        id: json["id"] ?? -1,
        orderNo: json["orderNo"] ?? 'null',
        orderDate: json["orderDate"] ??
            DateTime(2000)
                .toString(), // ! if i got null value from server i put 2000 into field
        orderSum: json["orderSum"] ?? -1,
        orderSumWithDiscount: json["orderSumWithDiscount"] ?? -1,
        creditDate: json['creditToDate'] ?? DateTime(0).toString(),
        customer: Customer.fromJson(json["customer"] ??
            {
              "id": -1,
              "name": "null",
              "city": "null",
              "district": "null",
              "address": "null"
            }),
        agent: Agent.fromJson(json["agent"] ?? {"id": -1, "fullName": "null"}),
        paymentType: PaymentType.fromJson(
            json["paymentType"] ?? {"id": -1, "name": "null"}),
        forConsignment: json['forConsignment'] ?? false,
        status: json["status"] ?? "null",
        modifiedBy: Agent.fromJson(
            json["modifiedBy"] ?? {"id": -1, "fullName": "null"}),
        createdDate: json["createdDate"] ??
            DateTime(2000)
                .toString(), // ! if i got null value from server i put 2000 into field
        updatedDate: json["updatedDate"] ??
            DateTime(2000)
                .toString(), // ! if i got null value from server i put 2000 into field
        comments: json['comments'] == null
            ? []
            : List<Comment>.from(
                json["comments"].map((x) => Comment.fromJson(x))),
        dets: json['dets'] == null
            ? []
            : List<Det>.from(json["dets"].map((x) => Det.fromJson(x))),
            orderType: json['forConsignment'] ? 2 : json['forConsignment'] == false && json['creditToDate'] == null ? 0 : json['creditToDate'] != null ? 1 : 0 ,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderNo": orderNo,
        "orderDate": orderDate,
        "orderSum": orderSum,
        "orderSumWithDiscount": orderSumWithDiscount,
        "customer": customer.toJson(),
        "agent": agent.toJson(),
        "paymentType": paymentType.toJson(),
        "status": status,
        "modifiedBy": modifiedBy.toJson(),
        "createdDate": createdDate,
        "updatedDate": updatedDate,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "dets": List<dynamic>.from(dets.map((x) => x.toJson())),
      };
}

class Agent {
  int id;
  String fullName;

  Agent({
    required this.id,
    required this.fullName,
  });

  factory Agent.fromRawJson(String str) => Agent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json["id"] ?? -1,
        fullName: json["fullName"] ?? 'null',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
      };
}

class Comment {
  String text;
  String commentDate;
  String commentType;
  Agent user;

  Comment({
    required this.text,
    required this.commentDate,
    required this.commentType,
    required this.user,
  });

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        text: json["text"] ?? 'null',
        commentDate: json["commentDate"] ?? DateTime(2000).toString(),
        commentType: json["commentType"] ?? 'null',
        user: Agent.fromJson(json["user"] ?? {"id": -1, "fullName": "null"}),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "commentDate": commentDate,
        "commentType": commentType,
        "user": user.toJson(),
      };
}

class Customer {
  int id;
  String name;
  String city;
  String district;
  String address;

  Customer({
    required this.id,
    required this.name,
    required this.city,
    required this.district,
    required this.address,
  });

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"] ?? -1,
        name: json["name"] ?? 'null',
        city: json["city"] ?? 'null',
        district: json["district"] ?? 'null',
        address: json["address"] ?? 'null',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "district": district,
        "address": address,
      };
}

class Det {
  String uuid;
  int id;
  Good good;
  num quantity;
  num stockQuantity;
  num price;
  Discount discount;
  String createdDate;
  String updatedDate;
  Agent modifiedBy;
  Protocol protocol;

  Det({
    required this.uuid,
    required this.id,
    required this.good,
    required this.quantity,
    required this.stockQuantity,
    required this.price,
    required this.discount,
    required this.createdDate,
    required this.updatedDate,
    required this.modifiedBy,
    required this.protocol,
  });

  factory Det.fromRawJson(String str) => Det.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Det.fromJson(Map<String, dynamic> json) => Det(
        uuid: Uuid().v4(),
        id: json["id"] ?? -1,
        good: Good.fromJson(json["good"]),
        quantity: json["quantity"],
        stockQuantity: json["stockQuantity"] ?? 0,
        price: json["price"] ?? 0.00,
        discount: Discount.fromJson(json["discount"] ??
            {"id": -1, "discountSum": 0, "description": ''}),
        createdDate: json["createdDate"] ?? 'null',
        updatedDate: json["updatedDate"] ?? 'null',
        modifiedBy: Agent.fromJson(json["modifiedBy"]),
        protocol: Protocol.fromJson(json["protocol"] ??
            {
              "price": -1,
              "isApproved": false,
            }),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "good": good.toJson(),
        "quantity": quantity,
        "stockQuantity": stockQuantity,
        "price": price,
        "discount": discount.toJson(),
        "createdDate": createdDate,
        "updatedDate": updatedDate,
        "modifiedBy": modifiedBy.toJson(),
        "protocol": protocol.toJson(),
      };
}

class Discount {
  int id;
  double sum;
  String des;

  Discount({required this.id, required this.sum, this.des = ''});

  factory Discount.fromRawJson(String str) =>
      Discount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
      id: json["id"] ?? -1,
      sum: json["discountSum"]?.toDouble() ?? 0.00,
      des: json["description"] ?? '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "sum": sum,
      };
}

class Good {
  int id;
  int invDetId;
  DateTime expDate;
  String barcode;
  PaymentType group;
  PaymentType type;
  PaymentType brand;
  PaymentType unit;
  String volume;
  String name;

  Good({
    required this.id,
    required this.invDetId,
    required this.expDate,
    required this.barcode,
    required this.group,
    required this.type,
    required this.brand,
    required this.unit,
    required this.volume,
    required this.name,
  });

  factory Good.fromRawJson(String str) => Good.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Good.fromJson(Map<String, dynamic> json) => Good(
        id: json["id"] ?? -1,
        invDetId: json["invDetId"] ?? -1,
        expDate: DateTime.parse(json["expDate"] ??
            DateTime(0).toString()), // ! 0 year as null safety
        barcode: json["barcode"] ?? '',
        group: PaymentType.fromJson(json["group"]),
        type: PaymentType.fromJson(json["type"]),
        brand: PaymentType.fromJson(json["brand"]),
        unit: PaymentType.fromJson(json["unit"]),
        volume: json["volume"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "invDetId": invDetId,
        "expDate":
            "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
        "barcode": barcode,
        "group": group.toJson(),
        "type": type.toJson(),
        "brand": brand.toJson(),
        "unit": unit.toJson(),
        "volume": volume,
        "name": name,
      };
}

class PaymentType {
  int id;
  String name;

  PaymentType({
    required this.id,
    required this.name,
  });

  factory PaymentType.fromRawJson(String str) =>
      PaymentType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"] ?? -1,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Protocol {
  num price;
  bool isAccepted;

  Protocol({
    required this.price,
    required this.isAccepted,
  });

  factory Protocol.fromRawJson(String str) =>
      Protocol.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Protocol.fromJson(Map<String, dynamic> json) => Protocol(
        price: json["price"] ?? 0.00,
        isAccepted: json["isAccepted"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "isAccepted": isAccepted,
      };
}
