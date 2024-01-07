import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tests/smsLimitMonitoringCubit/helper/hasOneHourPassed.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/smsModel.dart';

part 'sms_limit_monitoring_state.dart';

// TODO if dual sim sendind is work u must impliment second list... just add separedet lists for each sim card

class SmsLimitMonitoringCubit extends Cubit<SmsLimitMonitoringState> with HydratedMixin {
  SmsLimitMonitoringCubit()
      : super(const SmsLimitMonitoringState(
            smsListSimFirst: [], smsListSimSecond: []));

  void addSmsToFirstSim(SmsModel incomingSms) {
    final List<SmsModel> smsListState = List.from(state.smsListSimFirst);
    final List<SmsModel> newSmsListState = [];
    for (var i = 0; i < smsListState.length; i++) {
      bool isPassed = hasOneHourPassed(DateTime.parse(smsListState[i].sentDate));
      if (!isPassed) {
        newSmsListState.add(smsListState[i]);
      }
    }
    emit(SmsLimitMonitoringState(
        smsListSimFirst: List.from(newSmsListState)..add(incomingSms),
        smsListSimSecond: state.smsListSimSecond));
  }

  void addSmsToSecondSim(SmsModel incomingSms) {
    final List<SmsModel> smsListState = List.from(state.smsListSimSecond);
    final List<SmsModel> newSmsListState = [];
    for (var i = 0; i < smsListState.length; i++) {
      bool isPassed = hasOneHourPassed(DateTime.parse(smsListState[i].sentDate));
      if (!isPassed) {
        newSmsListState.add(smsListState[i]);
      }
    }
    emit(SmsLimitMonitoringState(
        smsListSimFirst: state.smsListSimFirst,
        smsListSimSecond: List.from(newSmsListState)..add(incomingSms)));
  }

  // void addSms(SmsModel sms) => emit(
  //     SmsLimitMonitoringState(smsList: List.from(state.smsList)..add(sms)));

  void clearSmsList() => emit(
      const SmsLimitMonitoringState(smsListSimFirst: [], smsListSimSecond: []));

  @override
  SmsLimitMonitoringState fromJson(Map<String, dynamic> json) {
    print(json.toString() + 'yo man im json');
    final smsListSimFirst =
        (json['smsListSimFirst'] as List<dynamic>).cast<Map<String, dynamic>>();
    final smsListSimSecond = (json['smsListSimSecond'] as List<dynamic>).cast<Map<String, dynamic>>();

    return SmsLimitMonitoringState(
        smsListSimFirst:
            smsListSimFirst.map((sms) => SmsModel.fromJson(sms)).toList(),
        smsListSimSecond:
            smsListSimSecond.map((sms) => SmsModel.fromJson(sms)).toList());
  }

  @override
  Map<String, dynamic>? toJson(SmsLimitMonitoringState state) {
    print(state.toMap());
    return state.toMap();
  }
}
