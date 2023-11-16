import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tests/savingOrderTest/models/sendableOrderModel.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/draftOrdersScreen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/sendableProductModel.dart';

part 'draft_orders_event.dart';
part 'draft_orders_state.dart';

class DraftOrdersBloc extends Bloc<DraftOrdersEvent, DraftOrdersState>
    with HydratedMixin {
  DraftOrdersBloc()
      : super(DraftOrdersState(
            sendableOrder: SendableOrderModel(
                comment: 'init',
                forConsignment: false,
                orderDate: DateTime(0).toString(),
                creditDate: DateTime(0).toString(),
                orderSum: 0,
                orderSumWithDiscount: 0,
                dets: [],
                customerId: 0,
                payTypeId: 0))) {
    on<AddDraft>((event, emit) {
      emit(DraftOrdersState(sendableOrder: event.draft));
    });
  }

  @override
  DraftOrdersState? fromJson(Map<String, dynamic> json) {
    return DraftOrdersState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DraftOrdersState state) {
    return state.orderToMap();
  }
}
