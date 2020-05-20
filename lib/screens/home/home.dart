import 'package:flutter/material.dart';
import 'package:myward/screens/home/bp&obs/bp&obs.dart';
import 'package:myward/screens/home/task/task.dart';
import 'package:myward/screens/home/ward/ward1.dart';
import 'package:myward/screens/profile/profile.dart';
import 'package:myward/screens/staff/staff.dart';
import 'package:myward/service/auth_service.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final AuthService authService = AuthService();

    Widget actionIcon(String imagePath){
      return CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      );
    }

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
                        child: actionIcon('images/nurse.png')
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        child: actionIcon('images/troly.png')
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        child: actionIcon('images/index.png')
                      ),
                      PopupMenuButton(
                          itemBuilder: (context)=>[
                            PopupMenuItem(
                                value : 1,child: Text('Profile'),
                            ),
                            PopupMenuItem(
                                value : 2,child: Text('Sign out')
                            )
                          ],
                        onSelected: (value) async{
                            if(value == 1){
                              return Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
                            }
                            else {
                              await authService.signOut();
                            }
                        },

                      ),
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
                  Tab(child: Text('Test'),),
                  Tab(child: Text('Chart'),),
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
