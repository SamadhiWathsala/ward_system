import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myward/service/patients_profiles.dart';

class FullDetails extends StatelessWidget {
  final String patientName;
  final String testDescription;
  final String bht;
  final String testId;


  FullDetails( this.bht, this.testDescription,  this.patientName ,this.testId,);

  final PatientDetailsService patientDetailsService = PatientDetailsService();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(
          barrierDismissible: false,
            context: context,
          builder: (context){
            return AlertDialog(
              title: Text(patientName),
              content: Text(testDescription,maxLines: 5,),
              actions: <Widget>[
                FlatButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Cancel')),
                FlatButton(onPressed: (){
                  patientDetailsService.updateTestStatus( testId, 'Done');
                  Navigator.of(context).pop();
                }, child: Text('Done')),
              ],
            );
          }

        );

      /*
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Scaffold(
          appBar: AppBar(
            title: Text('test request for '+patientName),
          ),
          body: Container(
              child:
              Text(testDescription)
          ),
        )
        )
        );
        */

      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0),
        child: Card(
          child: ListTile(
            title: Text(
              bht,
              style: TextStyle(
                  color: Colors.black, fontSize: 18.0, letterSpacing: 2.0
              ),
            ),
            subtitle: Text(patientName,style: TextStyle(color: Colors.black, fontSize: 16.0)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
