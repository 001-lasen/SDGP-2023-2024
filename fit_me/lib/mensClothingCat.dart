import 'package:flutter/material.dart';
import 'fashionItemList.dart';

class MensClothingCat extends StatefulWidget {
  @override
  _MensClothingCatState createState() => _MensClothingCatState();
}

class _MensClothingCatState extends State<MensClothingCat> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 2, 187),
          title: Text('Find your category!'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(68.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
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
                        icon: Icon(Icons.search, size: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _categoryButton("T-shirts", "imgs/shirts.jpeg"),
              SizedBox(height: 15),
              _categoryButton("Jeans", "imgs/trousers.jpeg"),
              SizedBox(height: 15),
              _categoryButton("Sunglasses", "imgs/shirts.jpeg"),
              SizedBox(height: 15),
              _categoryButton("Watches", "imgs/jackets.jpeg"),
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
    if (categoryName.toLowerCase().contains(searchText.toLowerCase()) || searchText.isEmpty) {
      return Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FashionItemList(keyword: categoryName),
              ),
            );
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
              ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 100, // Adjust image width as needed
                  height: 100, // Adjust image height as needed
                  fit: BoxFit.cover, // Make sure the image covers the entire circle
                ),
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
