import 'package:flutter/material.dart';

class MensClothingCat extends StatefulWidget {
  @override
  _MensClothingCatState createState() => _MensClothingCatState();
}

class _MensClothingCatState extends State<MensClothingCat> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
        title: Text('Men\'s Clothing Categories'), // Set the title to display the page name
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
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
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _categoryButton("Hoodies", "imgs/hoodies.jpeg"),
                    SizedBox(height: 15),
                    _categoryButton("Trousers", "imgs/trousers.jpeg"),
                    SizedBox(height: 15),
                    _categoryButton("Shirts", "imgs/shirts.jpeg"),
                    SizedBox(height: 15),
                    _categoryButton("Jackets", "imgs/jackets.jpeg"),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(String categoryName, String imagePath) {
    if (categoryName.toLowerCase().contains(searchText.toLowerCase()) || searchText.isEmpty) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children to start and end
            crossAxisAlignment: CrossAxisAlignment.center, // Align children vertically centered
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
                width: 100, // Adjust image width as needed
                height: 100, // Adjust image height as needed
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(); // Return an empty SizedBox if the category doesn't match the search
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: MensClothingCat(),
  ));
}
