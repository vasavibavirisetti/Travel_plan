import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'This app is developed by the students of 3rd year CAI Sri Vasavi Engineering College.',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
