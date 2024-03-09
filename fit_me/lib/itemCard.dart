import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String imagePath;

  ItemCard({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10), // Add some padding
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 2, 187), // Set the background color of the box
                border: Border.all(color: Color.fromARGB(255, 238, 2, 187)), // Add border
                borderRadius: BorderRadius.circular(10), // Add border radius
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(imagePath), // Display the image
                  SizedBox(height: 10), // Add some space between the image and the name
                  Text(name, style: TextStyle(fontSize: 24, color: Colors.white)), // Display the name
                ],
              ),
            ),
            SizedBox(height: 20), // Add some space between the box and the buttons
            ButtonTheme(
              minWidth: 200.0,
              height: 100.0,
              child: ElevatedButton(
                onPressed: () {
                  // Add your code here
                },
                child: Text('Try On'),
              ),
            ),
            SizedBox(height: 10), // Add some space between the buttons
            ButtonTheme(
              minWidth: 200.0,
              height: 100.0,
              child: ElevatedButton(
                onPressed: () {
                  // Add your code here
                },
                child: Text('Add to Closet'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}