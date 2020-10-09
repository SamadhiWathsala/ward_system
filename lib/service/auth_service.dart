import 'package:myward/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myward/models/nursing_staff.dart';


class AuthService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //create nurse object based on firebase user
  Nurse _userFromFirebaseUser(FirebaseUser user){
    return user != null ? Nurse(
        userKey: user.uid,
        email: user.email
    ) : null;
  }

  //auth change user stream
  Stream<Nurse> get user {
    return _firebaseAuth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  //sign up with email password
  Future registerWithEmailPassword(String email, String password,String name)async{
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //create new profile data document for newly added user
      await DatabaseService(uid: user.uid).updateNurseData(name,email,'images/nurseCover.png');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email password
  Future signInWithEmailPassword(String email, String password)async{
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _firebaseAuth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //send password reset email
  Future passwordReset(String email)async{
    try{
     return await _firebaseAuth.sendPasswordResetEmail(email: email).then((value)=>print('check your email'));
    }catch(e){
      print(e.toString());
      return null;
    }
  }



}