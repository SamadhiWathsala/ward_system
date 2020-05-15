import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/models/patients_details.dart';
import 'package:provider/provider.dart';

class PatientsList extends StatefulWidget {
  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<List<Patients>>(context) ?? [];

    if (patients.isEmpty) {
      return Center(
        child: Text(
          "There are no patients in your word",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400]),
        ),
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: patients.length,
        itemBuilder: (BuildContext context, int index) {
          return PatientsTile(patients: patients[index]);
        },
      );
    }
  }
}

class PatientsTile extends StatelessWidget {
  final Patients patients;

  PatientsTile({this.patients});

//create card template for reuse with each of category
  Widget listCardItem(String imagePath){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            patients.bht,
            style: TextStyle(
                color: Colors.black, fontSize: 18.0, letterSpacing: 2.0),
          ),
          subtitle: Text(patients.patientName ,style: TextStyle(color: Colors.black, fontSize: 16.0)),
          leading: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    //divide the patients list according to their category
    if (patients.category == 'MI') {
      return listCardItem('images/category/heart.jpg');
    } else if (patients.category == 'dengu') {
      return listCardItem('images/category/dengue.jpg');
    } else {
      return listCardItem('images/category/leptos.jpg');
    }
  }
}
