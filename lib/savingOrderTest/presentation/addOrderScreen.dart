import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddOrderScreen extends StatelessWidget {
  const AddOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: Text(
          'Add order',
        ),
        onPressed: () {
          print('add prod');
        },
      )),
    );
  }
}
