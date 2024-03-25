import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArcorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text('Open Web View'),
        ),
      ),
    );
  }

  _launchURL() async {
    final url = Uri.parse('https://sdgp-968cc.firebaseapp.com/');
    try {
      if (await canLaunch(url.toString())) {
        await launch(url.toString());
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      throw 'Could not launch $url :Error $e';
    }
  }
}