import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'closetItemCard.dart';
import 'category.dart';

class Closet extends StatefulWidget {
  @override
  ClosetState createState() => ClosetState();
}

class ClosetState extends State<Closet> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 2, 187),
          title: Text('Welcome to your closet!'),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collectionGroup('closet').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          if (snapshot.data?.docs.isEmpty ?? true) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Your closet is currently empty!",
                    style: TextStyle(fontSize: 20,),),
                  TextButton(
                    child: Text(
                      "Browse Items",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Category()),
                      );
                    },
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: snapshot.data?.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  return _categoryButton(data['itemName'], data['imagePath'], document.id);
                }).toList() ?? [],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _categoryButton(String itemName, String imagePath, String documentId) {
    if (itemName.toLowerCase().contains(searchText.toLowerCase()) || searchText.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0), // Add space around the button
        child: Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClosetItemCard(name: documentId, collectionGroup: 'closet'),
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
                      itemName,
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
        ),
      );
    } else {
      return SizedBox(); // Return an empty SizedBox if the category doesn't match the search
    }
  }
}

