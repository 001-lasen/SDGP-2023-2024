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
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8, // Adjust the width of the search bar
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search categories...',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, size: 20), // Adjust the size of the search icon
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
              _categoryButton("Suits", "imgs/suits.jpeg"),
              SizedBox(height: 15),
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
  }
}

void main() {
  runApp(MaterialApp(
    home: MensClothingCat(),
  ));
}
