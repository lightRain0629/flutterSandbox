// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'draft_orders_cubit.dart';

class DraftOrderState {
  // final SendableOrderModel sendableOrder;
    final bool forConsignment;
  final int customerId;
  final int payTypeId;
  final String orderDate;
  final String creditDate;
  final String comment;
  // final List<SendableProductModel> dets;
  final num orderSum;
  final num orderSumWithDiscount;
  const DraftOrderState({
    required this.forConsignment,
    required this.customerId,
    required this.payTypeId,
    required this.orderDate,
    required this.creditDate,
    required this.comment,
    // required this.dets,
    required this.orderSum,
    required this.orderSumWithDiscount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'forConsignment': sendableOrder.forConsignment,
      // 'customerId': sendableOrder.customerId,
      // 'payTypeId': sendableOrder.payTypeId,
      // 'orderDate': sendableOrder.orderDate,
      // 'creditDate': sendableOrder.creditDate,
      // 'comment': sendableOrder.comment,
      // 'dets': sendableOrder.dets.map((x) => x.toMap()).toList(),
      // 'orderSum': sendableOrder.orderSum,
      // 'orderSumWithDiscount': sendableOrder.orderSumWithDiscount,
      'forConsignment': forConsignment,
      'customerId': customerId,
      'payTypeId': payTypeId,
      'orderDate': orderDate,
      'creditDate': creditDate,
      'comment': comment,
      // 'dets': dets.map((x) => x.toMap()).toList(),
      'orderSum': orderSum,
      'orderSumWithDiscount': orderSumWithDiscount,

    };
    // return List.generate(
    //     sendableOrderList.length,
    //     (index) => <String, dynamic>{
    //           'forConsignment': sendableOrderList[index].forConsignment,
    //           'customerId': sendableOrderList[index].customerId,
    //           'payTypeId': sendableOrderList[index].payTypeId,
    //           'orderDate': sendableOrderList[index].orderDate,
    //           'creditDate': sendableOrderList[index].creditDate,
    //           'comment': sendableOrderList[index].comment,
    //           'dets':
    //               sendableOrderList[index].dets.map((x) => x.toMap()).toList(),
    //           'orderSum': sendableOrderList[index].orderSum,
    //           'orderSumWithDiscount':
    //               sendableOrderList[index].orderSumWithDiscount,
    //         });
  }

  factory DraftOrderState.fromMap(Map<String, dynamic> map) {
    // return DraftOrderState(
    //     sendableOrder: SendableOrderModel(
    //   forConsignment: map['forConsignment'] as bool,
    //   customerId: map['customerId'] as int,
    //   payTypeId: map['payTypeId'] as int,
    //   orderDate: map['orderDate'] as String,
    //   creditDate: map['creditDate'] as String,
    //   comment: map['comment'] as String,
    //   dets: List<SendableProductModel>.from(
    //     (map['dets'] as List<int>).map<SendableProductModel>(
    //       (x) => SendableProductModel.fromMap(x as Map<String, dynamic>),
    //     ),
    //   ),
    //   orderSum: map['orderSum'] as num,
    //   orderSumWithDiscount: map['orderSumWithDiscount'] as num,
    // ));
    return DraftOrderState(
              forConsignment: map['forConsignment'] as bool,
      customerId: map['customerId'] as int,
      payTypeId: map['payTypeId'] as int,
      orderDate: map['orderDate'] as String,
      creditDate: map['creditDate'] as String,
      comment: map['comment'] as String,
      // dets: List<SendableProductModel>.from(
      //   (map['dets'] as List<int>).map<SendableProductModel>(
      //     (x) => SendableProductModel.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
      orderSum: map['orderSum'] as num,
      orderSumWithDiscount: map['orderSumWithDiscount'] as num,
    );
    // return DraftOrderState(sendableOrderList: map.map(SendableOrderModel.fromJson).toList() as List<SendableOrderModel>);
  }

  String toJson() => json.encode(toMap());

  factory DraftOrderState.fromJson(String source) =>
      DraftOrderState.fromMap(json.decode(source) as Map<String, dynamic>);


}

