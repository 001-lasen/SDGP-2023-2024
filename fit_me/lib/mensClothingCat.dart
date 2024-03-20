import 'package:flutter/material.dart';
import 'HoodiesScreen.dart';
import 'TrousersScreen.dart';


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
                    _categoryButton("Hoodies", "imgs/hoodies.jpeg", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HoodiesScreen()),
                      );
                    }),
                    _categoryButton("Trousers", "imgs/trousers.jpeg", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrousersScreen()),
                      );
                    }),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(String categoryName, String imagePath, VoidCallback onPressed) {
    if (categoryName.toLowerCase().contains(searchText.toLowerCase()) || searchText.isEmpty) {
      return Container(
        width: double.infinity,
        child: ElevatedButton(
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
