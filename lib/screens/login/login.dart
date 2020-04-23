import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('lib/images/ward.jpg'),fit: BoxFit.cover),
          ),
          child: Flex(
              direction: Axis.vertical,
            children: <Widget>[

              Flexible(
                flex: 1,
                  child: Container(
                    //color: Colors.white,
                    child: Form(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width-60,
                              height: 50.0,
                              child: TextFormField(
                                decoration: InputDecoration(

                                  //prefixIcon: Icon(Icons.perm_identity,color: Colors.grey,),
                                  hintText:'ID Number',
                                  suffixIcon: Icon(Icons.perm_identity),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.brown,width: 2.0)
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.brown,width: 2.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.brown,width: 2.0)
                                  ),
                                ),
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width-60,
                              height: 50.0,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  //prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                                  hintText:'Password',suffixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.brown,width: 2.0)
                                  ),
                                  fillColor: Colors.white,

                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.brown,width: 2.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.brown,width: 2.0)
                                  ),
                                ),
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width-60,
                              height: 50.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.blue,
                                child: Text("Sign In",style: TextStyle(color: Colors.white),),
                                onPressed: (){},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
