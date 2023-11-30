import 'package:flutter/material.dart';

class HomePageNotificationTest extends StatelessWidget {
  const HomePageNotificationTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaton test'),
      ),
      body: Center(child: Text('Notification home page')),
    );
  }
}