import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/screens/home/home.dart';
import 'package:myward/service/authentication.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String name;
  String password;


  @override
  Widget build(BuildContext context) {

    final AuthService authService = AuthService();


    return SafeArea(
        child: Scaffold(
          //color: Colors.white,
          body: Stack(
            children: <Widget>[
              Image(image: AssetImage('images/logincover.png'),fit: BoxFit.cover,height: MediaQuery.of(context).size.height,),
              Container(
                color: Colors.black.withOpacity(0.7),
              ),
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Flexible(
                    child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(() => name = val.trim());
                                    },
                                    validator: (val) => val.isEmpty ? 'This field is required' : null,
                                    decoration: InputDecoration(
                                        hintText: 'ID number',
                                        prefixIcon: Icon(Icons.person)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white.withOpacity(0.5),
                                elevation: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    onChanged: (val){
                                      setState(() => password = val.trim());
                                    },
                                    validator: (val) => val.isEmpty ? 'This field is required' : null,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.lock),

                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.blue.shade900,
                                  elevation: 0.0,
                                  child: MaterialButton(
                                    onPressed: ()async{
                                      //TODO implement
                                      dynamic result = await authService.loginWithIDPassword(name, password);
                                      if(result == 'A'){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context){
                                              return AlertDialog(
                                                title: Text('Plz check your user name'),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text("Okay"),
                                                    onPressed: () {Navigator.of(context).pop();},
                                                  )
                                                ],
                                              );
                                            }
                                        );
                                      }
                                      if(result == 'B'){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context){
                                              return AlertDialog(
                                                title: Text('you entered password is incorrect'),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text("Okay"),
                                                    onPressed: () {Navigator.of(context).pop();},
                                                  )
                                                ],
                                              );
                                            }
                                        );
                                      }
                                      if(result == 'C'){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                                      }
                                      if(result == 'D'){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context){
                                              return AlertDialog(
                                                title: Text('Something went wrong tryagain'),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text("Okay"),
                                                    onPressed: () {Navigator.of(context).pop();},
                                                  )
                                                ],
                                              );
                                            }
                                        );
                                      }

                                    },
                                    child: Text("Sign In",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0
                                      ),
                                    ),
                                    minWidth: MediaQuery.of(context).size.width,
                                  )
                              ),
                            ),
                            Padding(padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("forgot password?",style: TextStyle(decoration: TextDecoration.none,fontSize: 12.0,color: Colors.blue))),
                            ),


                          ],
                        )
                    ),
                  ),

                ],              )
            ],
          ),
          bottomNavigationBar: Padding(padding: const EdgeInsets.all(8.0),
            child: RichText(maxLines: 2,
              text: TextSpan(
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15.0 ),
                  children: [
                    TextSpan(
                        text: "Don't have an accout? click here to"
                    ),
                    TextSpan(
                        text: " request!",
                        style: TextStyle(color: Colors.redAccent)
                    )
                  ]
              ),
            ),
          ),
        )
    );
  }
}


