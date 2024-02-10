import 'package:flutter/material.dart';
import 'mensClothingCat.dart';
import 'womenClothingCat.dart';

class Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Gender'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MensClothingCat()), // Use the MensClothingCat class
                );
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'imgs/men.jpg',
                    width: 300,
                    height: 300,
                  ),
                  //SizedBox(height: 0), // Decrease the space between the image and the text
                  Text(
                    'MEN',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Add a space between the buttons
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WomenensClothingCat()), // Use the MensClothingCat class
                );
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'imgs/women.jpg',
                    width: 300,
                    height: 300,
                  ),
                  //SizedBox(height: 0), // Decrease the space between the image and the text
                  Text(
                    'WOMEN',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}