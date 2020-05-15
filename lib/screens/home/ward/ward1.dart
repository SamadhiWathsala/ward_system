import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/models/patients_details.dart';
import 'package:myward/screens/home/ward/patients_list.dart';
import 'package:myward/service/patients_profiles.dart';
import 'package:provider/provider.dart';


class Ward extends StatefulWidget {


  @override
  _WardState createState() => _WardState();
}

class _WardState extends State<Ward> {




  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Patients>>.value(
            value: PatientDetailsService().patients,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: PatientsList(),
          ),
        )
      ;
  }
}
