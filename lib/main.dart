import 'package:flutter/material.dart';
import 'package:myward/landing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue.shade900
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

