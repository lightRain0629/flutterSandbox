part of 'sms_limit_monitoring_cubit.dart';

class SmsLimitMonitoringState extends Equatable {
  final List<SmsModel> smsListSimFirst;
  final List<SmsModel> smsListSimSecond;
  const SmsLimitMonitoringState({required this.smsListSimFirst, required this.smsListSimSecond});


    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'smsListSimFirst': smsListSimFirst.map((sms) => sms.toMap()).toList(),
      'smsListSimSecond': smsListSimSecond.map((sms) => sms.toMap()).toList()
    };
  }

    factory SmsLimitMonitoringState.fromMap(Map<String, dynamic> map) {
    return SmsLimitMonitoringState(
        smsListSimFirst: map['smsListSimFirst']
            .map<SmsModel>(SmsModel.fromJson)
            .toList(),
            smsListSimSecond: map['smsListSimSecond']
            .map<SmsModel>(SmsModel.fromJson)
            .toList()
             );
  }
   String toJson() => json.encode(toMap());

    factory SmsLimitMonitoringState.fromJson(String source) =>
      SmsLimitMonitoringState.fromMap(json.decode(source) as Map<String, dynamic>);
      
  @override
  List<Object> get props => [smsListSimFirst, smsListSimSecond];

}
