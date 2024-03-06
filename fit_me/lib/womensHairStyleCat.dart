import 'package:flutter/material.dart';

class WomesHairStyleCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Men\'s Clothing'),
        //backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _categoryButton("Curly Hair", "imgs/curly_hair.jpeg"),
              SizedBox(height: 15), 
              _categoryButton("Straight Hair", "imgs/straight_hair.jpeg"),
              SizedBox(height: 15), 
              _categoryButton("Wavy Hair", "imgs/wavy_hair.jpeg"),
              SizedBox(height: 15), 
              _categoryButton("Kinky Hair", "imgs/kinky_hair.jpeg"),
              SizedBox(height: 15), 
              _categoryButton("Butterfly Layer", "imgs/butterfly_layer.jpeg"),
              SizedBox(height: 1), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String categoryName, String imagePath) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10.0),
          backgroundColor: Colors.white, // Set button background color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WomesHairStyleCat(),
  ));
}
