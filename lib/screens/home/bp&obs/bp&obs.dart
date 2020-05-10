
/*
import 'package:flutter/material.dart';

class BpObs extends StatefulWidget {
  @override
  _BpObsState createState() => _BpObsState();
}

class _BpObsState extends State<BpObs> {
  @override
  Widget build(BuildContext context) {

    //TODO implement this view
    return SingleChildScrollView(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Blood Presure"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text("BHT Number"),
                    subtitle: Text("Patient Name"),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Observation"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Blood Presure"),
          )
        ],
      ),
    );
  }
}

 */
