import 'package:flutter/material.dart';
import 'itemCard.dart';

class MensHairStyleCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Men\'s Hair Style'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _categoryButton("Crew Cut Fade", "imgs/crew_cut_fade.jpeg", context),
              SizedBox(height: 15),
              _categoryButton("Taper Cut", "imgs/taper_cut.jpeg", context),
              SizedBox(height: 15),
              _categoryButton("Spiky Hair", "imgs/spiky_hair.jpeg", context),
              SizedBox(height: 15),
              _categoryButton("Quiff Hair", "imgs/quiff.jpeg", context),
              SizedBox(height: 15),
              _categoryButton("Messy Curls", "imgs/messy_curls.jpeg", context),
              SizedBox(height: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String categoryName, String imagePath, BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemCard(
                name: categoryName,
                imagePath: imagePath,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10.0),
          backgroundColor: Colors.white,
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