import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MYRoster extends StatefulWidget {
  @override
  _MYRosterState createState() => _MYRosterState();
}

class _MYRosterState extends State<MYRoster> {

  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
          calendarController: _calendarController
      ),
    );
  }
}
