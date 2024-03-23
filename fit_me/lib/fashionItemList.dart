import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'itemCard.dart';

class FashionItemList extends StatelessWidget {
  final String keyword;

  FashionItemList({required this.keyword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your clothing'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187)
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collectionGroup(keyword)  // Use keyword to specify the collection group
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Oops! Something went wrong!'));  // Center the error text
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());  // Show loading circle
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return _categoryButton(context, data['itemName'], data['imagePath']);
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _categoryButton(BuildContext context, String itemName, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical space
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemCard(
                name: itemName,
                collectionGroup: keyword,
              ),
            ),
          );
        },
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
                  itemName,
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
      ),
    );
  }
}