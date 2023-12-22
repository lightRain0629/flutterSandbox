import 'package:flutter/material.dart';

import 'loginApi.dart';

class TestLoginPage extends StatelessWidget {
  const TestLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: Text('Login'),
        onPressed: () async {
           await loginTest();
        },
      )),
    );
  }
}
