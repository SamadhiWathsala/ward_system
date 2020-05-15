import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myward/models/nursing_staff.dart';
import 'package:myward/screens/profile/component/my_rostre.dart';
import 'package:myward/screens/profile/edit_profile.dart';
import 'package:myward/service/database_service.dart';
import 'package:myward/service/image_picker.dart';
import 'package:myward/service/storage_service.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final ImagePickerService imagePickerService = ImagePickerService();
  final StorageService storageService = StorageService();
  final DatabaseService databaseService = DatabaseService();


  //change profile photo chose on device gallery
  Future<void> _chosePhoto(BuildContext context) async {
    try{
      final nurse = Provider.of<Nurse>(context,listen: false);
      //get image from image picker
      final file = await imagePickerService.pickImage(source: ImageSource.gallery);
      if(file != null){
        //upload file into the storage and get the URL
        final imageURL = await storageService.uploadAvatar(uid: nurse.userKey, file: file);
        //update the image reference on fire store
        await databaseService.updateProfilePhotoURL(nurse.userKey, imageURL);
        await file.delete();
      }
    }catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {

    final nurse = Provider.of<Nurse>(context,listen: false);


    //show edit user name bottom sheet
    void _showEditUserNamePanel(){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60.0,vertical: 20.0),
                child: EditProfile(),
              ),
            );
          }
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<Nurse>(
          stream: DatabaseService(uid: nurse.userKey).profileData,
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return Align(
                child: LinearProgressIndicator(),
              );
            }
            final profile = snapshot.data;
              return Stack(
                children: <Widget>[
                  Flex(direction: Axis.vertical,
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child: Stack(
                            children: <Widget>[

                              Container(
                                height: MediaQuery.of(context).size.height,
                                child: Image(image: AssetImage('images/ward.jpg'),fit: BoxFit.cover,),
                              ),
                              Container(
                                color: Colors.blue[900].withOpacity(0.6),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text('Profile',style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 1.5),)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:10.0,),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 25.0,), onPressed: null),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Colors.white,
                                      child: InkWell(
                                        onDoubleTap: ()async{
                                          await _chosePhoto(context);
                                        },
                                        child: CircleAvatar(
                                          radius: 55.0,
                                          backgroundImage: profile?.photoUrl != null ? NetworkImage(profile.photoUrl) : null,
                                          child: profile ?.photoUrl==null ? Icon(Icons.person) : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:4.0),
                                      child: InkWell(
                                        onDoubleTap: () => _showEditUserNamePanel(),
                                          child: Text(
                                              profile.userName,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 1.5)
                                          )
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:2.0),
                                      child: Text(profile.email,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white,)),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.build,color: Colors.white,size: 25,),
                                        onPressed: (){
                                         // Navigator.push(context, MaterialPageRoute(builder:(context)=>)
                                        }
                                    )
                                  ],
                                ),
                              ),

                            ],
                          )
                      ),
                      Flexible(

                        child: Container(
                          child: MYRoster(),
                        ),
                      )
                    ],
                  )
                ],
              );

          },
        ),
      ),
    );
  }
}
