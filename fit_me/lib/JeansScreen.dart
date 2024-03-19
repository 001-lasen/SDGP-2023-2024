import 'package:flutter/material.dart';

class JeansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeans'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _jeansButton(context, "Baggy Jeans", "imgs/baggy_jeans.jpeg"),
              SizedBox(height: 15),
              _jeansButton(context, "Straight Jeans", "imgs/straight_jeans.jpeg"),
              SizedBox(height: 15),
              _jeansButton(context, "Skinny Jeans", "imgs/skinny_jeans.jpeg"),
              SizedBox(height: 15),
              _jeansButton(context, "Flared Jeans", "imgs/flared_jeans.jpeg"),
              SizedBox(height: 15),
              _jeansButton(context, "Slimfit Jeans", "imgs/slimfit_jeans.jpeg"),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _jeansButton(BuildContext context, String jeansName, String imagePath) {
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
                  jeansName,
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
    home: JeansScreen(),
  ));
}
