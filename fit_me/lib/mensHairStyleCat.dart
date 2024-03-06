import 'package:flutter/material.dart';

class   MensHairStyleCat extends StatelessWidget {
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
              _categoryButton("Crew Cut Fade", "imgs/crew_ cut_fade.jpeg"),
              SizedBox(height: 15), 
              _categoryButton("Taper Cut", "imgs/taper_cut.jpeg"),
              SizedBox(height: 15), 
              _categoryButton("Spiky Hair", "imgs/spiky_hair.jpeg"),
              SizedBox(height: 15), 
              _categoryButton("Quiff Hair", "imgs/quiff.jpeg"),
              SizedBox(height: 15), 
              _categoryButton("Messy Curls", "imgs/messy_curls.jpeg"),
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
    home: MensHairStyleCat(),
  ));
}
