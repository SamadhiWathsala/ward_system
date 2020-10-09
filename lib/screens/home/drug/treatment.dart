import 'package:flutter/material.dart';
import 'package:myward/screens/home/drug/tratment_list.dart';
import 'package:myward/service/patients_profiles.dart';
import 'package:myward/models/treatment_details.dart';
import 'package:provider/provider.dart';

class Treatments extends StatefulWidget {

  @override
  _TreatmentsState createState() => _TreatmentsState();

}

class _TreatmentsState extends State<Treatments> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Treatment>>.value(
        value: PatientDetailsService().treatment,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TreatmentList(),
        ),
    );
  }

}
