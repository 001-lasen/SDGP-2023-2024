import 'package:flutter/material.dart';

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
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5, // Adjust the width of the search bar
                    padding: EdgeInsets.symmetric(horizontal:15),
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
              _categoryButton("Blouses", "imgs/blouse.jpeg"),
              SizedBox(height: 15),
              _categoryButton("Denims", "imgs/denim.jpeg"),
              SizedBox(height: 15),
              _categoryButton("Dresses", "imgs/dress.jpeg"),
              SizedBox(height: 15),
              _categoryButton("Skirts", "imgs/skirt.jpeg"),
              SizedBox(height: 15),
              _categoryButton("T-shirts", "imgs/tshirt.jpeg"),
              SizedBox(height: 15),
            ],
          ),
        ),
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
              Padding(
                padding: const EdgeInsets.only(right: 8.0), // Adjust the right padding as needed
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
    home: WomenensClothingCat(),
  ));
}
