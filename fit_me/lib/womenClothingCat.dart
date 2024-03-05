import 'package:flutter/material.dart';

class WomenensClothingCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Women\'s Clothing'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _categoryButton("Blouses", "imgs/blouse.jpeg"),
              _categoryButton("Denims", "imgs/denim.jpeg"),
              _categoryButton("Dresses", "imgs/dress.jpeg"),
              _categoryButton("Skirts", "imgs/skirt.jpeg"),
              _categoryButton("T-shirts", "imgs/tshirt.jpeg"),
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
