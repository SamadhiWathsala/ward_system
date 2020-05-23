import 'package:flutter/material.dart';
import 'package:myward/models/charts_data.dart';
import 'package:myward/screens/home/chart/chart_section.dart';
import 'package:myward/service/patients_profiles.dart';
import 'package:provider/provider.dart';

class ChartsDetails extends StatefulWidget {
  @override
  _ChartsDetailsState createState() => _ChartsDetailsState();
}

class _ChartsDetailsState extends State<ChartsDetails> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Chart>>.value(
      value: PatientDetailsService().charts,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
        child: ChartSection(),
      ),
    );

  }
}
