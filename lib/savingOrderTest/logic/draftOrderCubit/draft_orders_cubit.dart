import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tests/savingOrderTest/models/sendableOrderModel.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'draft_orders_state.dart';

class DraftOrdersCubit extends Cubit<DraftOrderState> with HydratedMixin {
  DraftOrdersCubit() : super(const DraftOrderState(drafts: []));

  void addDraft(draft) =>
      emit(DraftOrderState(drafts: List.from(state.drafts)..add(draft)));
  void clearDrafts() =>
      emit(const DraftOrderState(drafts: []));

  @override
  DraftOrderState? fromJson(Map<String, dynamic> json) {
    final drafts =
        (json['drafts'] as List<dynamic>).cast<Map<String, dynamic>>();

    return DraftOrderState(
        drafts:
            drafts.map((draft) => SendableOrderModel.fromJson(draft)).toList());
  }

  @override
  Map<String, dynamic>? toJson(DraftOrderState state) {
    return state.toMap();
  }
}
