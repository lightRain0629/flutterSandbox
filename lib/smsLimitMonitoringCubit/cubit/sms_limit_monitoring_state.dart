part of 'sms_limit_monitoring_cubit.dart';

sealed class SmsLimitMonitoringState extends Equatable {
  const SmsLimitMonitoringState();

  @override
  List<Object> get props => [];
}

final class SmsLimitMonitoringInitial extends SmsLimitMonitoringState {}
