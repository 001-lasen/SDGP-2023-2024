import 'package:flutter/material.dart';

class BlouseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blouses'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _blouseButton(context, "Off Shoulder", "imgs/offshoulder.jpeg"),
              SizedBox(height: 15),
              _blouseButton(context, "High neck", "imgs/highneck.jpeg"),
              SizedBox(height: 15),
              _blouseButton(context, "Chinese Collar", "imgs/chineesecollar.jpeg"),
              SizedBox(height: 15),
              _blouseButton(context, "Tube", "imgs/tube.jpeg"),
              SizedBox(height: 15),
              _blouseButton(context, "Crop Top", "imgs/crop.jpeg"),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _blouseButton(BuildContext context, String blouseName, String imagePath) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
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
                  blouseName,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Image.asset(
              imagePath,
              width: 100, // Adjust image width as needed
              height: 100, // Adjust image height as needed
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BlouseScreen(),
  ));
}
