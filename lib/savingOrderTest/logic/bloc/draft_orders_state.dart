part of 'draft_orders_bloc.dart';

class DraftOrdersState extends Equatable {
  final  SendableOrderModel sendableOrder;
  const DraftOrdersState({required this.sendableOrder});

  @override
  List<Object> get props => [sendableOrder];

   Map<String, dynamic> orderToMap() {
    return <String, dynamic>{
      'forConsignment': sendableOrder.forConsignment,
      'customerId': sendableOrder.customerId,
      'payTypeId': sendableOrder.payTypeId,
      'orderDate': sendableOrder.orderDate,
      'creditDate': sendableOrder.creditDate,
      'comment': sendableOrder.comment,
      'dets': sendableOrder.dets.map((x) => x.toMap()).toList(),
      'orderSum': sendableOrder.orderSum,
      'orderSumWithDiscount': sendableOrder.orderSumWithDiscount,
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

  factory DraftOrdersState.fromMap(Map<String, dynamic>  map) {
    return DraftOrdersState(
        sendableOrder: SendableOrderModel(
      forConsignment: map['forConsignment'] as bool,
      customerId: map['customerId'] as int,
      payTypeId: map['payTypeId'] as int,
      orderDate: map['orderDate'] as String,
      creditDate: map['creditDate'] as String,
      comment: map['comment'] as String,
      dets: List<SendableProductModel>.from(
        (map['dets'] as List<int>).map<SendableProductModel>(
          (x) => SendableProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      orderSum: map['orderSum'] as num,
      orderSumWithDiscount: map['orderSumWithDiscount'] as num,
    ));
    // return DraftOrdersState(sendableOrderList: map.map(SendableOrderModel.fromJson).toList() as List<SendableOrderModel>);
  }

  String toJson() => json.encode(orderToMap());

  factory DraftOrdersState.fromJson(String source) =>
      DraftOrdersState.fromMap(json.decode(source) as Map<String, dynamic>);
}
