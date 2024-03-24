import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'arcorepage.dart';
import 'closet.dart';
import 'package:collection/collection.dart';

class ItemCard extends StatefulWidget {
  final String name;
  final String collectionGroup;

  ItemCard({required this.name, required this.collectionGroup});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late Future<QuerySnapshot> _future;

  @override
  void initState() {
    super.initState();
    _future = FirebaseFirestore.instance
        .collectionGroup(widget.collectionGroup)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              FutureBuilder<QuerySnapshot>(
                future: _future,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final doc = snapshot.data!.docs.firstWhereOrNull((doc) => doc.id == widget.name);
                    if (doc != null) {
                      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 2, 187),
                          border: Border.all(color: Color.fromARGB(255, 238, 2, 187)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(data['imagePath']),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(data['description'], style: TextStyle(fontSize: 18, color: Colors.white)),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Text("Document not found");
                    }
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(height: 20),
              Container(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ARCorePage()),
                    );
                  },
                  child: Text('Try On'),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Closet()),
                    );
                  },
                  child: Text('Add to Closet'),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}