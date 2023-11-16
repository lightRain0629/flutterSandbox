import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../counterAndInetLogic/cubit/couter_cubit_cubit.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Text(state.counterValue.toString());
          },
        ),
      ),
    );
  }
}
