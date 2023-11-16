import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tests/constants/enums.dart';
import 'package:flutter_bloc_tests/logic/cubit/cubitInternet/internet_cubit.dart';

import '../../constants/enums.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        state is InternetDisconnected
            ? ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Check internet connection')))
            : print('connected');
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(child: Text(state is InternetDisconnected ? 'Disconnected' : 'Connected')),
        );
      },
    );
  }
}
