import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

// STEP1:  Stream setup
class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

StreamSocket streamSocket = StreamSocket();

//STEP2: Add this function in main function in main.dart file and add incoming data to the stream
void connectAndListen() {
  IO.Socket socket = IO.io('http://95.85.116.130:235/api/v1/socket.io/otp',
      OptionBuilder().setTransports(['websocket']).build());

  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });

  //When an event recieved from server, data is added to the stream
  socket.on('event', (data) => streamSocket.addResponse);
  socket.onDisconnect((_) => print('disconnect'));
}

//Step3: Build widgets with streambuilder

class BuildWithSocketStream extends StatelessWidget {
  const BuildWithSocketStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Socket io tests'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: streamSocket.getResponse,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            print('data status' + snapshot.hasData.toString());
            print(snapshot.data ?? 'null');
            return snapshot.hasData ? Text(snapshot.data!) : Text('null');
          },
        ),
      ),
    );
  }
}
