import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tests/smsLimitMonitoringCubit/cubit/sms_limit_monitoring_cubit.dart';
import 'package:flutter_bloc_tests/smsLimitMonitoringCubit/models/smsModel.dart';
import 'package:flutter_bloc_tests/webSocketsTest/simLogBodyPages/firstSimLogBody.dart';
import 'package:flutter_bloc_tests/webSocketsTest/simLogBodyPages/secondSimLogBody.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:telephony/telephony.dart';
import 'package:uuid/uuid.dart';

// TODO sendOTP: {phoneNumber: +99363384289, code: 2925} this is payload
/**
 * U must send otp to phoneNumber from payload and code as msg
 * 1) Write sms monitoring service
 * 2) check dual sim sending
 * 3) 404 status code is no online sender device
 * 4) 429 status code... in 1 minute available 2 sms... after 1 minute u can add resend functionality
 * 5) otp functionality available only production server... 235 port... in swagger this endpoint is not available
 * 6) 409 status code mean account already exist or conflict... if customer want to register on second time i must navigate to login page with 
 * pop up this account already exist
 */

// ! /api/v1/socket.io/otp socket listener on prod
// ! /api/v1/otp post Send sms
// ! /api/v1/otp get  Get count of online sender devices

class WStest extends StatefulWidget {
  const WStest({super.key});

  @override
  State<WStest> createState() => _WStestState();
}

class _WStestState extends State<WStest> {
  late IO.Socket socket;
  final Telephony telephony = Telephony.instance;

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  void initSocket() {
    socket = IO.io('http://95.85.116.130:235', <String, dynamic>{
      // ! global uri
      // socket = IO.io('http://10.10.12.33:3001', <String, dynamic>{
      // ! local uri
      'path': '/api/v1/socket.io/otp', // ? path for otp service
      'transports': ['websocket'],
      'reconnection': true,
      'reconnectionAttempts': 200,
      'reconnectionDelay': 2000,
    });

    socket.onConnect((_) {
      BlocProvider.of<SmsLimitMonitoringCubit>(context).addSmsToFirstSim(
          SmsModel(
              id: BlocProvider.of<SmsLimitMonitoringCubit>(context)
                  .state
                  .smsListSimFirst
                  .length,
              msg: 'connected',
              sentDate: DateTime.now(),
              phoneNumber: '+99362939884',
              sentSlot: 1,
              locale: 'eng',
              symbols: 9));
      setState(() {
        print('Connected to socket.io server');
      });
    });

    socket.onDisconnect((_) {
      setState(() {
        print('Disconnected from socket.io server');
      });
    });

    socket.on('sendOTP', (data) {
      setState(() {
        // _sendSms(data); // todo must impliment send sms to phoneNumber

        print('sendOTP: $data');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: BlocBuilder<SmsLimitMonitoringCubit, SmsLimitMonitoringState>(
        builder: (context, state) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  context.read<SmsLimitMonitoringCubit>().addSmsToSecondSim(
                      SmsModel(
                          id: state.smsListSimSecond.length,
                          msg:
                              'Message with id ${state.smsListSimSecond.length}',
                          sentDate: DateTime.now(),
                          phoneNumber: '901209',
                          sentSlot: 2,
                          locale: 'eng',
                          symbols: 3));
                },
              ),
              appBar: AppBar(
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: const Icon(Icons.sim_card),
                      text:
                          'Sim 1 (${state.smsListSimFirst.length.toString()})',
                    ),
                    Tab(
                      icon: const Icon(Icons.sim_card),
                      text:
                          'Sim 2 (${state.smsListSimSecond.length.toString()})',
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Connected: ' + socket.connected.toString()),
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<SmsLimitMonitoringCubit>(context)
                            .clearSmsList();
                      },
                      icon: const Icon(Icons.replay))
                ],
                title: const Text('OTP Demo'),
              ),
              body: const TabBarView(
                children: <Widget>[
                  FirstSimLogBody(),
                  SecondSimLogBody(),
                ],
              ));
        },
      ),
    );
  }

  // _sendSms(msg) async {
  //   telephony.sendSms(to: '+99362939884', message: msg);
  // }
}
