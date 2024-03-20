import 'package:flutter/material.dart';
import 'genderFashion.dart';
import 'genderHairStyles.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What are you looking for?'),
        backgroundColor: Color.fromARGB(255, 238, 2, 187),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GenderFashion()), // Use the GenderFashion class
                  );
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'imgs/fashion.jpeg',
                      width: 300,
                      height: 300,
                    ),
                    // Remove the SizedBox to reduce the space between the image and the text
                    Text(
                      'FASHION',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Add a space between the buttons
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GenderHairStyles()), // Use the GenderHairStyles class
                  );
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'imgs/hairStyle.jpg',
                      width: 300,
                      height: 300,
                    ),
                    // Remove the SizedBox to reduce the space between the image and the text
                    Text(
                      'HAIRSTYLES',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}