import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/service/auth_service.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {

  final AuthService _authService =AuthService();
  final _formKey =GlobalKey<FormState>();
  String email ='';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Padding(
              padding: const EdgeInsets.only(right: 10.0,bottom: 20.0,top: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:10.0),
                    child: CircleAvatar(
                      radius: 34,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 32,
                          child: Icon(Icons.lock,size: 50.0,)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                    child: Text('Reset Password',style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('We will send you to link...please click here to reset your password',style: TextStyle(fontSize: 16.0,color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0),
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
                        color: Colors.blue.shade900,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: (){
                            if(_formKey.currentState.validate()){
                              dynamic result = _authService.passwordReset(email);
                            }
                          },
                          child: Text("Send",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
