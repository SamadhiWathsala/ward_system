import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myward/models/nursing_staff.dart';


class AuthService{

  final CollectionReference nurseCollection = Firestore.instance.collection('Nurse');

  //Sign in with user name(staff ID number) password
  Future loginWithIDPassword(String userName,String password) async {
    try{
      dynamic result = await getNurseDetails(userName);
      if(result == null){
        print('Your user name is incorrect');
        return 'A';
      }
      else{
        if(password != result[0].passwordGet){
          print("You entered password is incorrect");
          return 'B';
        }
        else{
          print("login sucsess");
          return 'C';
        }
      }
    }
    catch(e){
      print(e.toString());
      return 'D';
    }
  }


  //fetch data about specific staff member
  Future<List<Nurse>>getNurseDetails(String userName) async {
    QuerySnapshot snapshot = await nurseCollection.where('name',isEqualTo: userName ).getDocuments();
    return snapshot.documents.map((DocumentSnapshot doc){
      return Nurse(
          userKey : doc.documentID,
          userName: doc.data['name'],
          passwordGet: doc.data['password']
      );
    }
    ).toList();

  }

}

