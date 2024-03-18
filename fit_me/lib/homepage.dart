import 'package:flutter/material.dart';
import 'category.dart';
import 'closet.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 238, 2, 187), // Changed the AppBar color
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 2, 187),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'imgs/logo.png',
                    width: 50, // Adjust width of the logo
                    height: 50, // Adjust height of the logo
                  ),
                  SizedBox(height: 10), // Add spacing between logo and user name
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset('imgs/viewprofile.png', width: 24, height: 24),
              title: Text('View Profile'),
              onTap: () {
                // Add functionality for view profile
              },
            ),
            ListTile(
              leading: Image.asset('imgs/tryon.png', width: 24, height: 24),
              title: Text('Try On History'),
              onTap: () {
                // Add functionality for try on history
              },
            ),
            ListTile(
              leading: Image.asset('imgs/aboutus.png', width: 24, height: 24),
              title: Text('About Us'),
              onTap: () {
                // Add functionality for about us
              },
            ),
            ListTile(
              leading: Image.asset('imgs/settings.png', width: 24, height: 24),
              title: Text('Settings'),
              onTap: () {
                // Add functionality for settings
              },
            ),
            ListTile(
              leading: Image.asset('imgs/helpandsupport.jpeg', width: 24, height: 24),
              title: Text('Support'),
              onTap: () {
                // Add functionality for support
              },
            ),
          ],
        ),
      ),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align items at the start of the column
          children: [
            Image.asset(
              'imgs/logo_trial.png',
              width: 300,
              height: 350,
            ), // Homescreen logo
            SizedBox(height: 25), // Change the space between the logo and the buttons here
            Container(
              width: 200, // Set the width of the button
              height: 60, // Set the height of the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Category()), // Use the Gender class
                  );
                },
                child: Text('TRY ON!'),
              ),
            ),
            SizedBox(height: 50), // Change the space between the buttons here
            Container(
              width: 200, // Set the width of the button
              height: 60, // Set the height of the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Closet()), // Use the Gender class
                  );
                },
                child: Text('YOUR CLOSET'),
              ),
            ),
            Spacer(), // Added a Spacer to push the text to the bottom
            Padding(
              padding: EdgeInsets.all(10), // Added a Padding to create a gap between the text and the edge of the screen
              child: Text(
                'I spent half an hour changing the size of the wrong image!!!',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )
    );
  }
}