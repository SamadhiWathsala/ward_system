import 'package:flutter/material.dart';

class BadPatients extends StatefulWidget {
  @override
  _BadPatientsState createState() => _BadPatientsState();
}

class _BadPatientsState extends State<BadPatients> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context,index){
        return Card(
          child: ListTile(
            title: Text("BHT Number"),
            subtitle: Text("Patient name"),
            trailing: CircleAvatar(
              backgroundColor: Colors.yellow,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        );
      },
    );
  }
}
