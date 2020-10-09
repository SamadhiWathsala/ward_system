import 'package:flutter/material.dart';
import 'package:myward/service/auth_service.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{

  final AuthService _authService = AuthService();
  final _formKey =GlobalKey<FormState>();

String email='';
String password='';
String error='';
String name='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register demo'),),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
        child: Form(
          key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an emeil' : null,
                  onChanged: (val){
                    setState(()=> email = val );
                  },
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  validator: (val) => val.length < 6 ? 'Enter an password with more then 6 character' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(()=> password = val );
                  },
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  validator: (val) => val.length < 6 ? 'Enter an password with more then 6 character' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(()=> name = val );
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                    onPressed: ()async{
                      if(_formKey.currentState.validate()) {
                        dynamic result = await _authService.registerWithEmailPassword(email, password,name);
                        if(result == null){
                          setState(()=> error = 'please supply valid email');
                        }
                      }
                    },
                    child: Text('Register'),
                ),
                SizedBox(height: 10,),
                Text(error),
              ],
          )
        ),
      ),
    );
  }
}
