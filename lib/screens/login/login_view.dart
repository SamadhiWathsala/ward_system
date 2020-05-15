import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/screens/home/home.dart';
import 'package:myward/screens/login/sign_up.dart';
import 'package:myward/service/auth_service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

final AuthService _authService = AuthService();
final _formKey =GlobalKey<FormState>();

//text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {

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
                      key: _formKey,
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
                                      setState(()=> email = val );
                                    },
                                    validator: (val) => val.isEmpty ? 'This field is required' : null,
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        prefixIcon: Icon(Icons.alternate_email)
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
                                      setState(()=> password = val );
                                    },
                                    validator: (val) => val.length < 6 ? 'Enter password more than 6 characters' : null,
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
                                      if(_formKey.currentState.validate()) {
                                        dynamic result = await _authService.signInWithEmailPassword(email, password);
                                        if(result == null){
                                          setState(()=> error = 'colud not Sign in with those credential');
                                          //TODO develop this error message displaying area
                                        }
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
                              child: Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                                    },
                                    child: Text(
                                    "forgot password?",
                                        style: TextStyle(decoration: TextDecoration.none,fontSize: 12.0,color: Colors.blue),

                                    ),
                                  )
                              ),
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


