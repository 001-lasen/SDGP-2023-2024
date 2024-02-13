import 'package:flutter/material.dart';
import 'mensHairStyleCat.dart';
import 'womensHairStyleCat.dart';

class GenderHairStyles extends StatelessWidget {
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
                          MensHairStyleCat()), // Use the MensClothingCat class
                );
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'imgs/menHairStyle.jpg',
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
                          WomesHairStyleCat()), // Use the MensClothingCat class
                );
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'imgs/womenHairStyle.jpg',
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