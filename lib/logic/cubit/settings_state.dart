// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool appNotification;
  final bool emailNotification;
  SettingsState(
      {required this.appNotification, required this.emailNotification});

  SettingsState copyWith(
{    required bool appNotification,
    required  bool emailNotification,}
  ) {
    return SettingsState(
        appNotification: appNotification ?? this.appNotification,
        emailNotification: emailNotification ?? this.emailNotification);
  }

  @override
  List<Object> get props => [appNotification, emailNotification];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appNotification': appNotification,
      'emailNotification': emailNotification,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      appNotification: map['appNotification'] as bool,
     emailNotification: map['emailNotification'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsState.fromJson(String source) => SettingsState.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class SettingsInitial extends SettingsState {}
