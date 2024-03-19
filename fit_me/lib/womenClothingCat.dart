import 'package:flutter/material.dart';

import 'BlouseScreen.dart';
import 'JeansScreen.dart';
import 'SkirtScreen.dart';
import 'DressScreen.dart';

class WomenensClothingCat extends StatefulWidget {
  @override
  _WomenensClothingCatState createState() => _WomenensClothingCatState();
}

class _WomenensClothingCatState extends State<WomenensClothingCat> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
        title: Text('Women\'s Clothing Categories'), // Set the title to display the page name
      ),
      body: SingleChildScrollView( // Wrap your ListView with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Add padding to create space between the page name and the buttons
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search categories...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              _categoryButton("Blouses", "imgs/blouse.jpeg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlouseScreen()), // Navigate to BlouseScreen
                );
              }),
              SizedBox(height: 15),
              _categoryButton("Jeans", "imgs/jean.jpeg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JeansScreen()), // Navigate to JeansScreen
                );
              }),
              SizedBox(height: 15),
              _categoryButton("Skirts", "imgs/skirt.jpeg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SkirtScreen()), // Navigate to SkirtScreen
                );
              }),
              SizedBox(height: 15),
              _categoryButton("Dresses", "imgs/dress.jpeg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DressScreen()), // Navigate to DressScreen
                );
              }),
              SizedBox(height: 15),
              // Add other category buttons here
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String categoryName, String imagePath, VoidCallback onPressed) {
    if (searchText.isEmpty || categoryName.toLowerCase().contains(searchText.toLowerCase())) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
            ),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: WomenensClothingCat(),
  ));
}
