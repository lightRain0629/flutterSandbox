import 'package:hive/hive.dart';

part 'customersModel.g.dart';

@HiveType(typeId: 1)
class CustomersModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  num balance;
  @HiveField(3)
  String currencyName;
  @HiveField(4)
  String uuid;
  @HiveField(5)
  String city;
  @HiveField(6)
  String district;
  @HiveField(7)
  String phoneNumber;
  @HiveField(8)
  String customerName;

  CustomersModel(
      {required this.id,
      required this.name,
      required this.balance,
      required this.currencyName,
      this.uuid = '',
      required this.city,
      required this.district,
      required this.phoneNumber,
      required this.customerName});

  static CustomersModel fromJson(json) => CustomersModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'name',
      balance: json['balance'] ?? 0.00,
      uuid: json['uuid'] ?? '',
      // currencyName: json['currencyName'] ?? 'currencyName'
      currencyName: json['currencyName'].contains('Доллар США')
          ? 'USD'
          : json['currencyName'].contains('Манат')
              ? 'TMT'
              : 'TMT',
      city: json['city'] ?? '',
      district: json['district'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      customerName: json['customerName'] ?? '');
}
