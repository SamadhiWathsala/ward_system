import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myward/models/nursing_staff.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference nurseCollection = Firestore.instance.collection('Nurse');

  //create new documents for newly register nurse
  Future updateNurseData(String name, String email, String photo)async {
    return await nurseCollection.document(uid).setData({
      'uid' : uid,
      'name' : name,
      'email' : email,
      'photo' : photo,
    });
  }

  //update profile picture URL
  Future updateProfilePhotoURL(String uid, String photoURL)async{
    return await nurseCollection.document(uid).updateData({
      'photo' : photoURL
    });
  }

  //nurse profile data from snapshot
  Nurse _nurseProfileDataFromSnapshot(DocumentSnapshot snapshot){
    return Nurse(
      userKey: snapshot.documentID,
      userName: snapshot.data['name'],
      email: snapshot.data['email'],
      photoUrl: snapshot.data['photo']
    );
  }
  
  //get nurse stream
  Stream<Nurse> get profileData{
    return nurseCollection.document(this.uid).snapshots()
        .map(_nurseProfileDataFromSnapshot);
  }
  
  

}