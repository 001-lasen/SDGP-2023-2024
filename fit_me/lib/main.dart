import 'package:flutter/material.dart';
import 'category.dart';
import 'closet.dart'; // Import the second_page.dart file

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
        child: Container(
          color: Color.fromARGB(255, 238, 2, 187), // Set the background color of the drawer to the same color as the AppBar
          child: Stack(
            children: <Widget>[
              // The rest of the drawer code goes here.
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'We are venom!',
                    style: TextStyle(color: Colors.white), // Set the font color of the text to white
                  ),
                ),
              ),
            ],
          ),
        ),
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
                  MaterialPageRoute(builder: (context) => Category()), // Use the Gender class
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
            child: Text('Play Minecraft!'),
          ),
        ],
      ),
    );
  }
}