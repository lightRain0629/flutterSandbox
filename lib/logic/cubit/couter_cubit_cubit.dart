import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tests/logic/cubit/cubitInternet/internet_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'couter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {

  CounterCubit() : super(CounterState(counterValue: 0)){

  }

  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncremented: false)); 

  void addManually(int val) => emit(CounterState(counterValue: val, wasIncremented: true));
  
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
