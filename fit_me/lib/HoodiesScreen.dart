import 'package:flutter/material.dart';

class HoodiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoodies'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _hoodiesButton(context, "Oversized Hoodie", "imgs/oversizedhoodie.jpeg"),
              SizedBox(height: 15),
              _hoodiesButton(context, "Pullover Hoodie", "imgs/pulloverhoodie.jpeg"),
              SizedBox(height: 15),
              _hoodiesButton(context, "Graphic Hoodie", "imgs/graphichoodie.jpeg"),
              SizedBox(height: 15),
              _hoodiesButton(context, "Cardigan Hoodie", "imgs/cardiganhoodie.jpeg"),
              SizedBox(height: 15),
              _hoodiesButton(context, "Heavy Weight Hoodie", "imgs/heavyweighthoodie.jpeg"),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hoodiesButton(BuildContext context, String hoodiesName, String imagePath) {
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
                  hoodiesName,
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
    home: HoodiesScreen(),
  ));
}
