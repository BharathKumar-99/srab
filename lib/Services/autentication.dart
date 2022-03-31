

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthenticationServices{
final FirebaseAuth _firebaseAuth;

AuthenticationServices(this._firebaseAuth);


Stream<User?> get authStatechanges => _firebaseAuth.authStateChanges();

Future<String> signin({required String email,required String password}) async{
  try{
      await _firebaseAuth.signInWithEmailAndPassword
      (email: email, password: password);
      
      return  "Signedin";
  } on FirebaseAuthException catch(e){
    print(e.toString()+" error");
    return e.message.toString();

  }
  
}
Future<String> signup({required String email,required String password})async{
   try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return  "Signedup";
  } on FirebaseAuthException catch(e){
    return e.message.toString();

  }
}
}