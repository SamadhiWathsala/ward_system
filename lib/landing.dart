import 'package:flutter/material.dart';
import 'package:myward/models/nursing_staff.dart';
import 'package:myward/screens/home/home.dart';
import 'package:myward/screens/login/login_view.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final nurse = Provider.of<Nurse>(context);

    if(nurse == null){
      return Login();
    }else{
      return Home();
    }
  }
}
