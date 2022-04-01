import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:srab/Services/UserData.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth;

  AuthenticationServices(this._firebaseAuth);

  Stream<User?> get authStatechanges => _firebaseAuth.authStateChanges();

  Future<String> signin(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return "Signedin";
    } on FirebaseAuthException catch (e) {
      print(e.toString() + " error");
      return e.message.toString();
    }
  }

  Future<String> signup(
      {required String email, required String password,required String fullName,
      List? followers,List? following,List? post,String? picurl}) async {
    try {
      UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
          CollectionReference users=FirebaseFirestore.instance
          .collection('users');
      AddUser user = AddUser(
          fullName, email, password, cred.user!.uid, followers, following, post, picurl);
      await users
          .doc(cred.user!.uid)
          .set(user.toJson());
      return "Signedup";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
