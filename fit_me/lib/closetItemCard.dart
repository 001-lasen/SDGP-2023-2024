import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'arcorepage.dart';
import 'closet.dart';
import 'package:collection/collection.dart';

class ClosetItemCard extends StatefulWidget {
  final String name;
  final String collectionGroup;

  ClosetItemCard({required this.name, required this.collectionGroup});

  @override
  _ClosetItemCardState createState() => _ClosetItemCardState();
}

class _ClosetItemCardState extends State<ClosetItemCard> {
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
                            SizedBox(height: 20),
                            Container(
                              width: 200.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArcorePage(),
                                  ),
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
                                onPressed: () async {
                                  // Query the 'closet' collection for a document with the same itemNo as the item.
                                  final querySnapshot = await FirebaseFirestore.instance
                                      .collection('closet')
                                      .where('itemNo', isEqualTo: data['itemNo'])
                                      .get();

                                  // If a document with the same itemNo exists, delete it.
                                  if (querySnapshot.docs.isNotEmpty) {
                                    await FirebaseFirestore.instance.collection('closet').doc(querySnapshot.docs.first.id).delete();

                                    // Show a dialog box.
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Item removed from your closet!'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Closet()),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Text('Remove from Closet'),
                              ),
                            ),
                            SizedBox(height: 100),
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
            ],
          ),
        ),
      ),
    );
  }
}