import 'package:flutter/material.dart';

class Closet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Closet'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: Center(
        child: Text('Welcome to your closet! Currently under development'),
      ),
    );
  }
}