import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../counterAndInetLogic/cubit/couter_cubit_cubit.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

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
      floatingActionButton: Column(children: [
        FloatingActionButton(onPressed: (){
          BlocProvider.of<CounterCubit>(context).increment();
        }, heroTag: 'btn 1',
        child: Icon(Icons.add),),
        SizedBox(
          height: 20,
        ),
        FloatingActionButton(onPressed: (){
                    BlocProvider.of<CounterCubit>(context).decrement();
        }, heroTag: 'btn 2', child: Icon(Icons.remove),),
      ],),
    );
  }
}
