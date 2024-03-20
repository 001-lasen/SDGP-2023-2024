import 'package:flutter/material.dart';

class TrousersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trousers'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _trousersButton(context, "Cargo Pant", "imgs/cargo.jpeg"),
              SizedBox(height: 15),
              _trousersButton(context, "Jogger Pant", "imgs/jogger.jpeg"),
              SizedBox(height: 15),
              _trousersButton(context, "Jean", "imgs/JeanT.jpeg"),
              SizedBox(height: 15),
              _trousersButton(context, "Slim Jean", "imgs/slimJean.jpeg"),
              SizedBox(height: 15),
              _trousersButton(context, "Pleated Trouser", "imgs/pleatedT.jpeg"),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _trousersButton(BuildContext context, String TrousersName, String imagePath) {
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
                  TrousersName,
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
    home: TrousersScreen(),
  ));
}
