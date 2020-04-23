import 'package:flutter/material.dart';

class Ward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

        Padding(
            padding: const EdgeInsets.all(8.0),
          child: Text('Bad Patients'),
        ),

        //bad patients scrolling list




        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('All Patients'),
        ),

        //all patients scrolling list


        
      ],
    );
  }
}
