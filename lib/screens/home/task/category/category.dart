import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        title: Text('Category Name'),
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0),
              topRight: Radius.circular(60.0)
          ),
          // gradient: Gradient(colors: [Colors.blue,Colors.grey])
        ),
        child: ListView.builder(
          itemCount: 6,
            itemBuilder: (context,index){
            return Hero(
              tag: "BHT",
              child: Card(
                child: ListTile(
                  title: Text('BHT Number'),
                  subtitle: Text('Patient Name'),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.purple,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            );
            }
        ),
      ),
    );
  }
}


class TaskDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "BHT",
      child: Container(
        child: Column(
          children: <Widget>[
            Text("BHT Number"),
            Text("Patient Name"),
            Text("Addres"),
            Text("Test Name"),
            Row(
              children: <Widget>[
                Expanded(
                    child: (Text("cancel"))
                ),
                Expanded(
                    child: (Text("Done"))
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

