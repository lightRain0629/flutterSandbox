import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tests/constants/enums.dart';
import 'package:flutter_bloc_tests/logic/cubit/cubitInternet/internet_cubit.dart';
import '../../logic/cubit/couter_cubit_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                print('tapped');
                Navigator.pushNamed(context, '/settings', arguments: "arguments data");

              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Center(
          child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) async {
          numController =
              TextEditingController(text: state.counterValue.toString());
          // // TODO: implement listener
          // if (state.wasIncremented == true) {
          //   await Future.delayed(Duration(seconds: 1));
          //   await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text('U have incremented 1'),
          //     duration: Duration(milliseconds: 300),
          //   ));
          // } else {
          //   await Future.delayed(Duration(seconds: 1));
          //   await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text('U have decremented 1'),
          //     duration: Duration(milliseconds: 300),
          //   ));
          // }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, stateInet) {
                  if (stateInet is InternetConnected &&
                      stateInet.connectionType == ConnectionType.Wifi) {
                    return Text('Wi fi connected');
                  } else if (stateInet is InternetConnected &&
                      stateInet.connectionType == ConnectionType.Mobile) {
                    return Text('Mobile inet is working');
                  } else if (stateInet is InternetDisconnected) {
                    return Text('U r disconnected from internet');
                  } else if (stateInet is InternetDisconnected &&
                      stateInet.connectionType == ConnectionType.none) {
                    return Text('Disconnected');
                  } else {
                    return Text('Idk');
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  print('second page');
                  Navigator.of(context).pushNamed('/second');
                },
                child: Text('Second Page'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print('third page');
                  Navigator.of(context).pushNamed('/third');
                },
                child: Text('Third Page'),
              ),
              Builder(builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final internetState = context.watch<InternetCubit>().state;
                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Wifi) {
                  return Text('Counter  ' +
                      counterState.counterValue.toString() +
                      '  Internet: WiFi');
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Mobile) {
                  return Text('Counter  ' +
                      counterState.counterValue.toString() +
                      '  Internet: Mobile');
                } else {
                  return Text('Disconnected');
                }
              }),
              Text('Count'),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: TextFormField(
                  // initialValue: numController.text,
                  controller: numController,
                  // validator: (value){
                  //   value = state.counterValue.toString();
                  // },
                  // onChanged: (val){
                  //   val = state.counterValue.toString();
                  // },

                  onFieldSubmitted: (val) {
                    BlocProvider.of<CounterCubit>(context)
                        .addManually(int.parse(val));
                    val = state.counterValue.toString();
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  // initialValue: state.counterValue.toString(),
                  decoration: InputDecoration(
                      hintText: state.counterValue.toString(),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Builder(builder: (context) {
                final counterVal = context
                    .select((CounterCubit cubit) => cubit.state.counterValue);
                return Text('Cntr ' + counterVal.toString());
              }),
              SizedBox(
                height: 10,
              ),
              Text(state.counterValue.toString()),
            ],
          );
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
