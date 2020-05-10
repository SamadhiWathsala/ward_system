import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/screens/home/ward/all_patients.dart';

class Ward extends StatelessWidget {


  Widget buildKeyTerm({Color color, String keyName}){
          return Expanded(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: color,
                ),
                Text(keyName)
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              buildKeyTerm(color:Colors.yellow, keyName: "MI"),
              buildKeyTerm(color:Colors.green, keyName: "Dengue"),
              buildKeyTerm(color:Colors.purple, keyName: "Leptos"),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'More Considerable Patients',
                    style: TextStyle(
                        color: Colors.blueGrey[800], fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: BadPatients(),
                )

              ]
          ),
        )
      ],
    );
  }
}
