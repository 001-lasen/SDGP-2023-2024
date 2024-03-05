import 'package:flutter/material.dart';

class MensClothingCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Men\'s Clothing'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _categoryButton("Hoodies", "imgs/hoodies.jpeg"),
              _categoryButton("Trousers", "imgs/trousers.jpeg"),
              _categoryButton("Shirts", "imgs/shirts.jpeg"),
              _categoryButton("Jackets", "imgs/jackets.jpeg"),
              _categoryButton("Suits", "imgs/suits.jpeg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String categoryName, String imagePath) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          backgroundColor: Colors.white, // Set button background color
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 100, // Adjust image width as needed
              height: 100, // Adjust image height as needed
            ),
            SizedBox(width: 100), // Add some spacing between image and text
            Text(
              categoryName,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
