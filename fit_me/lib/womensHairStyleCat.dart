import 'package:flutter/material.dart';
import 'itemCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WomesHairStyleCat extends StatefulWidget {
  @override
  _WomesHairStyleCatState createState() => _WomesHairStyleCatState();
}

class _WomesHairStyleCatState extends State<WomesHairStyleCat> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Stream _stream = FirebaseFirestore.instance
      .collectionGroup("Women's Hair Style")
      .snapshots();

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
          child: StreamBuilder(
            stream: _stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data!.docs.map<Widget>((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    return _categoryButton(data['itemName'], data['imagePath'], context);
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String categoryName, String imagePath, BuildContext context) {
    if (_searchQuery.isNotEmpty && !categoryName.toLowerCase().contains(_searchQuery.toLowerCase())) {
      return SizedBox.shrink(); // Hide the button if it doesn't match the search query
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical space
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemCard(
                  name: categoryName,
                  collectionGroup: "Women's Hair Style",
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
              Padding(
                padding: EdgeInsets.all(10.0), // Add padding around the image
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Change to circle
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
