import 'package:flutter/material.dart';
import 'package:myward/models/treatment_details.dart';
import 'package:myward/service/patients_profiles.dart';
import 'package:provider/provider.dart';

class TreatmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final treatment = Provider.of<List<Treatment>>(context) ?? [];

    if (treatment.isEmpty) {
      return Center(
        child: Text(
          "There are no treatment at this time",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400]),
        ),
      );
    } else {
      return TreatmentTypes();
    }


  }
}



class TreatmentTypes extends StatelessWidget {


  final PatientDetailsService patientDetailsService = PatientDetailsService();

  final Treatment treatment;
  TreatmentTypes({this.treatment});

  @override
  Widget build(BuildContext context) {


    Widget treatmentTypeTile(String type, int count, String title,List category){
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Scaffold(
            backgroundColor: Colors.blue[900],
            appBar: AppBar(
              title: Text(title),
              elevation: 0.0,
            ),
            body: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0)
                ),
                // gradient: Gradient(colors: [Colors.blue,Colors.grey])
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: count,
                    itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text(category[index].patientName),
                                content: Text(category[index].description,maxLines: 5,),
                                actions: <Widget>[
                                  FlatButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child: Text('Cancel')),
                                  FlatButton(onPressed: (){
                                    patientDetailsService.updateTreatmentStatus(category[index].treatmentId,'done');
                                    print(category[index].treatmentId);
                                    Navigator.of(context).pop();
                                  }, child: Text('Done')),
                                ],
                              );
                            }
                        );
                      },
                      child: ListTile(
                        title: Text(category[index].bht),
                        subtitle: Text(category[index].patientName),
                      ),
                    );
                    }
                ),
              ),
            ),
          )
          )
          );
        },
        child: Card(
            child: ListTile(
              title: Text(type),
              trailing: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Text(count.toString()),
              ),
            ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        )
      );
    }



    //filter treatment according their treatment type
    final oral = Provider.of<List<Treatment>>(context).where((treatment)=> treatment.type == 'oral').toList();
    final rectal = Provider.of<List<Treatment>>(context).where((treatment)=> treatment.type == 'rectal').toList();
    final subLingual = Provider.of<List<Treatment>>(context).where((treatment)=> treatment.type == 'subLingual').toList();
    final injection= Provider.of<List<Treatment>>(context).where((treatment)=> treatment.type == 'iv').toList();
    final intraNasal= Provider.of<List<Treatment>>(context).where((treatment)=> treatment.type == 'intraNasal').toList();
    final topical= Provider.of<List<Treatment>>(context).where((treatment)=> treatment.type == 'topical').toList();
    final transDermal = Provider.of<List<Treatment>>(context).where((treatment)=> treatment.type == 'transDermal').toList();
    final gatte = Provider.of<List<Treatment>>(context).where((treatment)=> treatment.type == 'Gatte').toList();


    return ListView(
        children: <Widget>[

          treatmentTypeTile('Oral', oral.length,'Oral',oral),
          treatmentTypeTile('Rectal', rectal.length,'Rectal',rectal),
          treatmentTypeTile('SubLingual', subLingual.length,'Sublingual',subLingual),
          treatmentTypeTile('injection', injection.length,'IV/IM/SC',injection),
          treatmentTypeTile('Intranasal', intraNasal.length,'Intranasal',intraNasal),
          treatmentTypeTile('Topical', topical.length,'Topical',topical),
          treatmentTypeTile('Transdermal', transDermal.length,'Transdermal',transDermal),
          treatmentTypeTile('gatte', gatte.length,'Gatte',gatte),

        ],
    );

  }

}
