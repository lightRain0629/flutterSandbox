import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';



part 'draft_orders_state.dart';

class DraftOrdersCubit extends Cubit<DraftOrderState> with HydratedMixin {
  DraftOrdersCubit()
      : super(DraftOrderState(
            comment: 'init',
            forConsignment: false,
            orderDate: DateTime(0).toString(),
            creditDate: DateTime(0).toString(),
            orderSum: 0,
            orderSumWithDiscount: 0,
            // dets: [],
            customerId: 0,
            payTypeId: 0));

  void addDraft() => emit(DraftOrderState(
      comment: 'not innit',
      forConsignment: false,
      orderDate: DateTime(0).toString(),
      creditDate: DateTime(0).toString(),
      orderSum: 0,
      orderSumWithDiscount: 0,
      // dets: [],
      customerId: 0,
      payTypeId: 0));

  @override
  DraftOrderState? fromJson(Map<String, dynamic> json) {
    return DraftOrderState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DraftOrderState state) {
    return state.toMap();
  }
}
