import 'package:flutter/material.dart';
import 'itemCard.dart';

class WomesHairStyleCat extends StatefulWidget {
  @override
  _WomesHairStyleCatState createState() => _WomesHairStyleCatState();
}

class _WomesHairStyleCatState extends State<WomesHairStyleCat> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 2, 187),
          title: Text('Find your Hairstyle!'),
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
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search hairstyles...',
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
              SizedBox(height: 10),
              _categoryButton("Curly Hair", "imgs/curly_hair.jpeg", context),
              SizedBox(height: 15),
              _categoryButton("Straight Hair", "imgs/straight_hair.jpeg", context),
              SizedBox(height: 15),
              _categoryButton("Wavy Hair", "imgs/wavy_hair.jpeg", context),
              SizedBox(height: 15),
              _categoryButton("Kinky Hair", "imgs/kinky_hair.jpeg", context),
              SizedBox(height: 15),
              _categoryButton("Butterfly Layer", "imgs/butterfly_layer.jpeg", context),
              SizedBox(height: 1),
            // ignore: unnecessary_null_comparison
            ].where((widget) => widget != null).toList(), // Filter out null widgets
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: '     search categories',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _categoryButton(String categoryName, String imagePath, BuildContext context) {
    if (_searchQuery.isNotEmpty && !categoryName.toLowerCase().contains(_searchQuery.toLowerCase())) {
      return SizedBox.shrink(); // Hide the button if it doesn't match the search query
    }

    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemCard(
                name: categoryName,
                imagePath: imagePath,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10.0),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WomesHairStyleCat(),
  ));
}
