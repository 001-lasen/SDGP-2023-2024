import 'package:flutter/material.dart';

class ARCorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARCore Page'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: Center(
        child: Text(
          'Under Development',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}