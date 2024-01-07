import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../smsLimitMonitoringCubit/cubit/sms_limit_monitoring_cubit.dart';

class FirstSimLogBody extends StatelessWidget {
  const FirstSimLogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmsLimitMonitoringCubit, SmsLimitMonitoringState>(
      builder: (context, state) {
        if (state.smsListSimFirst.isEmpty) {
          return const Center(
            child: Text('Empty'),
          );
        } else {
          return ListView.builder(
            itemCount: state.smsListSimFirst.length,
            itemBuilder: (context, index) {
            final sms = state.smsListSimFirst[index];
            return ListTile(title: Text(sms.id.toString()),subtitle: Text('Sent date ${DateFormat('Hms')
                      .format(DateTime.parse(sms.sentDate))} ${DateFormat('dd.MM.yyyy').format(DateTime.parse(sms.sentDate))}'),);
          });
        }
      },
    );
  }
}
