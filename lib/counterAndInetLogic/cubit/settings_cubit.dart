import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin{
  SettingsCubit()
      : super(SettingsState(appNotification: false, emailNotification: false));

  void toggleAppNotifications(bool newVal) => emit(state.copyWith(
      appNotification: newVal, emailNotification: state.emailNotification));

  void toggleEmailNotifications(bool newVal) => emit(state.copyWith(
      appNotification: state.appNotification, emailNotification: newVal));
      
        @override
        SettingsState? fromJson(Map<String, dynamic> json) {
          return SettingsState.fromMap(json);
        }
      
        @override
        Map<String, dynamic>? toJson(SettingsState state) {
          return state.toMap();
        }
}
