import 'package:flutter/material.dart';
import 'package:myward/screens/home/task/category/category.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Course categories',
              style: TextStyle(
                  color: Colors.blueGrey[800], fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              itemCount: 8,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('Category Name'),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text('6'),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
