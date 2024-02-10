// mens_clothing_cat.dart
import 'package:flutter/material.dart';

class MensClothingCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Men\'s Clothing'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: SingleChildScrollView( // Make the page scrollable
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Align items at the center of the column
            children: [
              Container(
                width: double.infinity, // Make the button width the width of the screen
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('1'),
                ),
              ),
              Container(
                width: double.infinity, // Make the button width the width of the screen
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('2'),
                ),
              ),
              Container(
                width: double.infinity, // Make the button width the width of the screen
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('3'),
                ),
              ),
              Container(
                width: double.infinity, // Make the button width the width of the screen
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('4'),
                ),
              ),
              Container(
                width: double.infinity, // Make the button width the width of the screen
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('5'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}