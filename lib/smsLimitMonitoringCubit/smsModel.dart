import 'dart:convert';

import 'package:hive/hive.dart';

part 'smsModel.g.dart';

@HiveType(typeId: 3)
class SmsModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String msg;
  @HiveField(2)
  final DateTime sentDate;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final int sentSlot;
  @HiveField(5)
  final String locale;
  @HiveField(6)
  final int symbols;

  SmsModel({
    required this.id,
    required this.msg,
    required this.sentDate,
    required this.phoneNumber,
    required this.sentSlot,
    required this.locale,
    required this.symbols
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'msg': msg,
      'sentDate': sentDate.millisecondsSinceEpoch,
      'phoneNumber': phoneNumber,
      'sentSlot': sentSlot,
    };
  }

  factory SmsModel.fromMap(Map<String, dynamic> map) {
    return SmsModel(
      id: map['id'] as int,
      msg: map['msg'] as String,
      sentDate: DateTime.fromMillisecondsSinceEpoch(map['sentDate'] as int),
      phoneNumber: map['phoneNumber'] as String,
      sentSlot: map['sentSlot'] as int,
      locale: map['locale'] as String,
      symbols: map['symbols'] as int
    );
  }

  String toJson() => json.encode(toMap());

  static SmsModel fromJson(json) => SmsModel(
      id: json['id'],
      msg: json['msg'],
      sentDate: DateTime.parse(json['sentDate']),
      phoneNumber: json['phoneNumber'],
      sentSlot: json['sentSlot'],
      locale: json['locale'],
      symbols: json['symbols']
      );
}
