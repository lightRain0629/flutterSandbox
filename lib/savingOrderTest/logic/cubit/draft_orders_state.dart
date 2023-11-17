// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'draft_orders_cubit.dart';

class DraftOrderState {
  final List<SendableOrderModel> drafts;

  const DraftOrderState({required this.drafts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'drafts': drafts.map((person) => person.toMap()).toList()
    };
  }

  factory DraftOrderState.fromMap(Map<String, dynamic> map) {
    return DraftOrderState(
        drafts: map['drafts']
            .map<SendableOrderModel>(SendableOrderModel.fromJson)
            .toList());
  }

  String toJson() => json.encode(toMap());

  factory DraftOrderState.fromJson(String source) =>
      DraftOrderState.fromMap(json.decode(source) as Map<String, dynamic>);
}
