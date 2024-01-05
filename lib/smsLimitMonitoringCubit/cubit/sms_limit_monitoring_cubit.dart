import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sms_limit_monitoring_state.dart';

class SmsLimitMonitoringCubit extends Cubit<SmsLimitMonitoringState> {
  SmsLimitMonitoringCubit() : super(SmsLimitMonitoringInitial());
}
