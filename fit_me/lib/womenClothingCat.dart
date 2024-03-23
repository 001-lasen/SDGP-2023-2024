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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0), // Increase the height to accommodate the space
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 2, 187),
          title: Text('Find your category!'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(68.0), // Increase the height to accommodate the space
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8, // Increase the width of the search bar
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                  SizedBox(height: 10), // Add space below the search bar
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              _categoryButton("Blouses", "imgs/blouse.jpeg", () {}),
              SizedBox(height: 15),
              _categoryButton("Jeans", "imgs/jean.jpeg", () {}),
              SizedBox(height: 15),
              _categoryButton("Skirts", "imgs/skirt.jpeg", () {}),
              SizedBox(height: 15),
              _categoryButton("Dresses", "imgs/dress.jpeg", () {}),
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
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover, // Make sure the image covers the entire circle
              ),
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
