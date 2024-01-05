import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tests/smsLimitMonitoringCubit/helper/hasOneHourPassed.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../smsModel.dart';

part 'sms_limit_monitoring_state.dart';

// TODO if dual sim sendind is work u must impliment second list... just add separedet lists for each sim card

class SmsLimitMonitoringCubit extends Cubit<SmsLimitMonitoringState>
    with HydratedMixin {
  SmsLimitMonitoringCubit() : super(const SmsLimitMonitoringState(smsList: []));

  void addSms(SmsModel incomingSms) {
    final List<SmsModel> smsListState = List.from(state.smsList);
    final List<SmsModel> newSmsListState = [];
    for (var i = 0; i < smsListState.length; i++) {
      bool isPassed = hasOneHourPassed(smsListState[i].sentDate);
      if (!isPassed) {
        newSmsListState.add(smsListState[i]);
      }
    }
    emit(
        SmsLimitMonitoringState(smsList: List.from(newSmsListState)..add(incomingSms)));
  }

  // void addSms(SmsModel sms) => emit(
  //     SmsLimitMonitoringState(smsList: List.from(state.smsList)..add(sms)));

  void clearSmsList() => emit(const SmsLimitMonitoringState(smsList: []));

  @override
  SmsLimitMonitoringState? fromJson(Map<String, dynamic> json) {
    final smsList =
        (json['smsList'] as List<dynamic>).cast<Map<String, dynamic>>();

    return SmsLimitMonitoringState(
        smsList: smsList.map((sms) => SmsModel.fromJson(smsList)).toList());
  }

  @override
  Map<String, dynamic>? toJson(SmsLimitMonitoringState state) {
    return state.toMap();
  }
}
