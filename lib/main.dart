import 'package:flutter/material.dart';
import 'package:myward/landing.dart';
import 'package:myward/models/nursing_staff.dart';
import 'package:myward/service/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Nurse>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue.shade900
        ),
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}

