import 'package:flutter/material.dart';
import 'package:myward/models/nursing_staff.dart';
import 'package:myward/service/database_service.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  
  final _formKey = GlobalKey<FormState>();
  
  //form value
  String _currentName;
  
  @override
  Widget build(BuildContext context) {

    final nurse = Provider.of<Nurse>(context);

    return AlertDialog(
      content: StreamBuilder<Nurse>(
          stream: DatabaseService(uid: nurse.userKey).profileData,
          builder: (context, snapshot){
            if(snapshot.hasData){
              Nurse userProfile = snapshot.data;
              return Material(
                  child: Form(
                      key: _formKey,
                      child: Column(
                          children:<Widget>[
                            Text(
                                'Edit Profile',
                                style:TextStyle(fontSize:20.0)
                            ),
                            SizedBox(height:20.0),
                            TextFormField(
                              initialValue:userProfile.userName,
                              // add some Text Decorations here
                              validator:(val) => val.isEmpty ? 'Please Enter a name !' : null,
                              onChanged:(val) => setState(() => _currentName = val),
                            ),
                            SizedBox(height:20.0),
                            RaisedButton(
                              color:Colors.blue,
                              child:Text(
                                  'Save Changes',
                                  style:TextStyle(color: Colors.white)
                              ),
                              onPressed: () async {
                                if(_formKey.currentState.validate()){
                                  await DatabaseService(uid: nurse.userKey).updateNurseData(
                                    _currentName ?? userProfile.userName,
                                    userProfile.email,
                                    userProfile.photoUrl,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                            )
                          ]
                      )
                  ),
                );
            }else{
              return Align(
                  child:CircularProgressIndicator()
              );
            }
          }
      ),
    );
  }
}
