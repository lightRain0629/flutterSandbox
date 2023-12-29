import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketTestPage extends StatefulWidget {
  final WebSocketChannel channel;
  const WebSocketTestPage({super.key, required this.channel});

  @override
  State<WebSocketTestPage> createState() => _WebSocketTestPageState();
}


class _WebSocketTestPageState extends State<WebSocketTestPage> {
late TextEditingController editingController;
  @override
  void initState() {
    // TODO: implement initState
    editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (editingController.text.isNotEmpty) {
            widget.channel.sink.add(editingController.text);
          }
        },
        child: Icon(Icons.send),
      ),
      appBar: AppBar(
        title: const Text('Testing web sockets'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                child: TextFormField(
                  controller: editingController,
              decoration:
                  const InputDecoration(labelText: 'send something to server'),
            )),
            StreamBuilder(
                stream: widget.channel.stream,
                builder: ((context, snapshot) {
                  return snapshot.hasData
                      ? Text(snapshot.data)
                      : const Text('no data');
                }))
          ],
        ),
      ),
    );
  }

  void _sendMyMessage() {
    if (editingController.text.isNotEmpty) {
      setState(() {
        print(editingController.text);
        widget.channel.sink.add(editingController.text);
      });
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
