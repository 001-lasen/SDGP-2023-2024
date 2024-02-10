import 'package:flutter/material.dart';
import 'gender.dart'; // Import the second_page.dart file

//Put all images in the imgs folder in the directory

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FitMe!'),
    );
  }
}

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
        // The rest of the drawer code goes here.
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align items at the start of the column
        children: [
          Image.asset('imgs/logo_trial.png'), // Homescreen logo
          Container(
            width: 200, // Set the width of the button
            height: 60, // Set the height of the button
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gender()), // Use the Gender class
                );
              },
              child: Text('TRY ON!'),
            ),
          ),
          SizedBox(height: 100), // Change the space between the buttons here
          Container(
            width: 200, // Set the width of the button
            height: 60, // Set the height of the button
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Text('YOUR CLOSET'),
            ),
          ),
          Spacer(), // Added a Spacer to push the text to the bottom
          Padding(
            padding: EdgeInsets.all(10), // Added a Padding to create a gap between the text and the edge of the screen
            child: Text('Welcome to the dark side!!'),
          ),
        ],
      ),
    );
  }
}