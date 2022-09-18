import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final days = 1000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
      body: Container(
        child: Center(
          child: Text("First Flutter $days App"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
