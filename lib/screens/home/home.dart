import 'package:flutter/material.dart';
import 'package:myward/screens/home/bp&obs/bp&obs.dart';
import 'package:myward/screens/home/task/task.dart';
import 'package:myward/screens/home/ward/ward.dart';
import 'package:myward/screens/staff/staff.dart';
import 'package:myward/service/authentication.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final AuthService authService = AuthService();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
          appBar: AppBar(
            actions: <Widget>[
              Column(
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Staff()));
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/nurse.png'),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/troly.png'),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/index.png'),
                        ),
                      ),
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () async{
                       // dynamic result = await authService.logOut();
                      }
                      )
                    ],
                  ),
                ],
              )
            ],
            backgroundColor: Colors.blue.shade900,
            title: Text('My Ward'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                 bottom: Radius.circular(40),
                ),
              ),
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.green]),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),
              tabs: <Widget>[
                  Tab(child: Text('Ward'),),
                  Tab(child: Text('Tasks'),),
                  Tab(child: Text('BP/Obs'),),
                  Tab(child: Text('Drug'),),
              ],
            ),
            elevation: 0.0,
        ),
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  topRight: Radius.circular(60.0)
              ),
           // gradient: Gradient(colors: [Colors.blue,Colors.grey])
          ),
          child: TabBarView(
              children: <Widget>[
                Ward(),
                Tasks(),
                Tab(icon: Icon(Icons.brightness_3),),
                Tab(icon: Icon(Icons.brightness_3),)
              ],
          ),
        ),
      ),
    );
  }
}
