import 'package:flutter/material.dart';
import 'package:myward/models/test_details.dart';
import 'package:provider/provider.dart';


class CategorizedTest extends StatefulWidget {
  @override
  _CategorizedTestState createState() => _CategorizedTestState();
}

class _CategorizedTestState extends State<CategorizedTest> {

  @override
  Widget build(BuildContext context) {

    final bloodTest = Provider.of<List<Test>>(context).where((test)=> test.testCategory == 'blood').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Blood test'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: bloodTest.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(
                     bloodTest[index].bht,
                      style: TextStyle(
                          color: Colors.black, fontSize: 18.0, letterSpacing: 2.0),
                    ),
                    subtitle: Text(bloodTest[index].patientId ,style: TextStyle(color: Colors.black, fontSize: 16.0)),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              );;
            }
        ),
      ),
    );
  }
}


