
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Screens/BasicInfo.dart';
import 'package:health_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sharedpref.dart';
class AuthService {
  dynamic error="";
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Users _userFromFirebaseUser(User user){
    return user!=null ? Users(uid: user.uid) : null;
  }
  Stream<Users> get user {
    return _auth.authStateChanges()

        .map(_userFromFirebaseUser);
  }
  displayerror(){
    return error;
  }

  String showemail(){
    final User user = _auth.currentUser;
    String emailid = user.email;
    if(emailid==null){
      emailid="guest";
    }

    return emailid;
  }
  // sign in anon
  Future signInAnon() async {
    try {

      UserCredential result = await _auth.signInAnonymously();
      User user = result.user ;
      return user;
    } catch (e) {
      error=e.toString();
      print(e.toString());
      return null;
    }
  }



// sign in with email and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uid=await _auth.currentUser.uid;
      prefs.setString("uid", uid);
     // double bmr=1798;
      var collection = await FirebaseFirestore.instance.collection('usersdata').where(
          'uid', isEqualTo: uid);
      var querySnapshot = await collection.get();
print("hjlkhkh");
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = await queryDocumentSnapshot.data();
        print("hjlkhkh");
        String a=data['bmr'].toString();
        String b= data['bmi'].toString();
        await    prefs.setString('uid', uid);
        await prefs.setString('weight', data['weight']);
        await prefs.setString('bmr',a );
        await prefs.setString('bmi',b);

      }
    //  SharedPreferences pre = await SharedPreferences.getInstance() ;
     // prefs.setString("bmr", bmr.toString());
      User user= result.user;
      return _userFromFirebaseUser(user);
    }catch (e){
      error=e.toString();
      print(e);
      return null;
    }
  }

// register with email and password
  Future registerWithEmailAndPassword(String email,String password,String username ,BuildContext context) async{

    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user= result.user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
  String    uid=_auth.currentUser.uid;
      prefs.setString('uid', uid);
      SharedPreferenceHelper().saveUserEmail(email);
      SharedPreferenceHelper().saveUserId(uid);
      SharedPreferenceHelper()
          .saveUserName(username);

      Map<String,dynamic> additems ={

        'username': username,'email': email, 'uid': uid,
      };
      CollectionReference reference =FirebaseFirestore.instance.collection("users");
      await reference.add(additems);
   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>GatherInfo()));
      return _userFromFirebaseUser(user);
    }catch (e) {
      error=e.toString();
      print(e);
      return null;
    }
  }

//reset passowrd
  Future resetPassword(String email) async {
    try{

      await _auth.sendPasswordResetEmail(email: email);
      error= "Reset email send ";
    }catch(e){
      error=e.toString();
      print(e);
      return null;
    }
  }


// sign out
  Future signOut() async{
    try{
      await _auth.signOut();
    }catch(e){
      print(e.toString());
    }

  }

  getCurrentUser() async {
    return await _auth.currentUser;
    print("\n \n\n\n\n\n\n\n\n \n \n \n \n \n n lalsa \n");
  }
}