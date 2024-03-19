import 'package:flutter/material.dart';

class DressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dresses'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dressesButton(context, "Shirt Dress", "imgs/shirtdress.jpeg"),
              SizedBox(height: 15),
              _dressesButton(context, "Mini Dress", "imgs/minidress.jpeg"),
              SizedBox(height: 15),
              _dressesButton(context, "Tube Dress", "imgs/tubedress.jpeg"),
              SizedBox(height: 15),
              _dressesButton(context, "Maxi Dress", "imgs/maxidress.jpeg"),
              SizedBox(height: 15),
              _dressesButton(context, "Blazer Dress", "imgs/blazerdress.jpeg"),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dressesButton(BuildContext context, String dressName, String imagePath) {
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
                  dressName,
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
    home: DressScreen(),
  ));
}
