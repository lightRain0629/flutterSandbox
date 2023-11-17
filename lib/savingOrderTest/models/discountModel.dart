import 'package:hive/hive.dart';

part 'discountModel.g.dart';

@HiveType(typeId: 7)
class Discount {
  @HiveField(0)
  int id;
  @HiveField(1)
  int? goodGroupId;
  @HiveField(2)
  int? goodTypeId;
  @HiveField(3)
  int? brandId;
  @HiveField(4)
  int? gidId;
  @HiveField(5)
  int? customerId;
  @HiveField(6)
  String? condition;
  @HiveField(7)
  int discount;
  @HiveField(8)
  String? beginDate;
  @HiveField(9)
  String discountType;
  @HiveField(10)
  String description;
  @HiveField(11)
  List<dynamic> exceptionList;

  Discount({
    required this.id,
    this.goodGroupId,
    this.goodTypeId,
    this.brandId,
    this.gidId,
    this.customerId,
    this.condition,
    required this.discount,
    this.beginDate,
    required this.discountType,
    required this.description,
    required this.exceptionList,
  });

  factory Discount.fromJson(json) => Discount(
      id: json["id"] ?? 0,
      goodGroupId: json["goodGroupId"] ?? null,
      condition: json["condition"] ?? null,
      customerId: json["customerId"] ?? null,
      discount: json["discount"] ?? 0,
      discountType: json["discountType"] ?? 'null',
      beginDate: json["beginDate"] ?? DateTime.now().toString(),
      goodTypeId: json["goodTypeId"] ?? null,
      brandId: json["brandId"] ?? null,
      gidId: json["goodInvDetId"] ?? null,
      description:  json['description'] ?? '',
      // exceptionList: List<int>.from(json["excludeInvDetIds"].map((x)=>x)) // ! u must replace fake name of variable with real name 
      exceptionList: json["excludeInvDetIds"] ?? [] // ! u must replace fake name of variable with real name 
      );
}
