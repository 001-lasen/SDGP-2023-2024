import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_screen.dart'; // Import the CameraScreen widget

class ItemCard extends StatefulWidget {
  final String name;
  final String imagePath;

  ItemCard({required this.name, required this.imagePath});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late CameraController controller;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        controller = CameraController(cameras[0], ResolutionPreset.medium);
        controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
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
                    child: Image.asset(widget.imagePath),
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
                    child: Text("Description goes here", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
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
                      builder: (context) => CameraScreen(controller: controller),
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
                onPressed: () {
                  // Add your code here
                },
                child: Text('Add to Closet'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}