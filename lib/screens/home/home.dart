import 'package:flutter/material.dart';
import 'package:myward/screens/home/ward/ward.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
          appBar: AppBar(
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('lib/images/nurse.png'),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('lib/images/troly.png'),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('lib/images/index.png'),
                        ),
                      ),
                      IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
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
                Tab(icon: Icon(Icons.brightness_3),),
                Tab(icon: Icon(Icons.brightness_3),),
                Tab(icon: Icon(Icons.brightness_3),)
              ],
          ),
        ),
      ),
    );
  }
}
