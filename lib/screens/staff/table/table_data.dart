import 'package:flutter/material.dart';

class BodyData extends StatefulWidget {
  @override
  _BodyDataState createState() => _BodyDataState();
}

class _BodyDataState extends State<BodyData> {

  Widget bodyData() => DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text('Nurse'),
            numeric: false,
            tooltip: 'To display nurse profile picture',
            onSort: (i,b){}
        ),
        DataColumn(
            label: Text('Date'),
            numeric: false,
            tooltip: 'To display nurse Duty',
            onSort: (i,b){}
        )
      ],


      rows: <DataRow>[
        DataRow(
            cells: <DataCell>[
              DataCell(
                  CircleAvatar(
                    backgroundImage: AssetImage('images/profile.png'),
                  )
              )
            ]
        )
      ]
  );



  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: GridTile(child: CircleAvatar(
            backgroundImage: AssetImage('images/profile.png'),
          ),
            header: GridTile(child: Text('Nurse Name')),
          ),
        )
      ],
    );
  }
}
