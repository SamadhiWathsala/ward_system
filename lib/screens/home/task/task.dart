import 'package:flutter/material.dart';
import 'package:myward/models/test_details.dart';
import 'package:myward/screens/home/task/category/test_list.dart';
import 'package:myward/service/patients_profiles.dart';
import 'package:provider/provider.dart';


class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Test>>.value(
      value: PatientDetailsService().test,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TaskList(),
      ),
    );
  }
}





