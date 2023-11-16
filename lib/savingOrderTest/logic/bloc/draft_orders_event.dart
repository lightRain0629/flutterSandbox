// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'draft_orders_bloc.dart';

sealed class DraftOrdersEvent extends Equatable {
  const DraftOrdersEvent();

  @override
  List<Object> get props => [];
}

class AddDraft extends DraftOrdersEvent {
  final SendableOrderModel draft;
 const AddDraft({
    required this.draft,
  });

  @override
  List<Object> get props => [draft];
}
