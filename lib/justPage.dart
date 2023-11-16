import 'package:flutter/material.dart';
import 'package:flutter_bloc_tests/testCamQr.dart';

class JustPage extends StatelessWidget {
  const JustPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(child: Text('camera'), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },)),
    );
  }
}