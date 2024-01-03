import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:telephony/telephony.dart';

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
      'path': '/api/v1/socket.io/otp',
      'transports': ['websocket'],
      'reconnection': true,
      'reconnectionAttempts': 200,
      'reconnectionDelay': 2000,
    });

    socket.onConnect((_) {
     setState(() {
        _sendSms('connected to socket.io');
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
        _sendSms(data);
        print('sendOTP: $data');
      });
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Socket IO Demo'),
      ),
      body: Center(
        child: Text(socket.connected.toString()),
      ),
    );
  }

  _sendSms(msg) async {
    telephony.sendSms(to: '+99362939884', message: msg);
  }
}
