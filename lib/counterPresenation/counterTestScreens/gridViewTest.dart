import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid view test'),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) =>   Container()),
    );
  }
}
