part of 'sms_limit_monitoring_cubit.dart';

class SmsLimitMonitoringState extends Equatable {
  final List<SmsModel> smsList;
  const SmsLimitMonitoringState({required this.smsList});

  @override
  List<Object> get props => [smsList];

    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'smsList': smsList.map((sms) => sms.toMap()).toList()
    };
  }

    factory SmsLimitMonitoringState.fromMap(Map<String, dynamic> map) {
    return SmsLimitMonitoringState(
        smsList: map['smsList']
            .map<SmsModel>(SmsModel.fromJson)
            .toList());
  }

   String toJson() => json.encode(toMap());
}
