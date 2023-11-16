import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tests/logic/cubit/settings_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Settings')),
          body: ListView(children: [
            SwitchListTile(
              value: state.appNotification,
              onChanged: (newVal){
                context.read<SettingsCubit>().toggleAppNotifications(newVal);
                
              },
              title: Text('App notifications'),
            ),
            SwitchListTile(
              value: state.emailNotification,
              onChanged: (newVal){
                context.read<SettingsCubit>().toggleEmailNotifications(newVal);
                
              },
              title: Text('Email notifications'),
            ),
          ]),
        );
      },
    );
  }
}
