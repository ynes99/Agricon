import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebasetest/constants/constants.dart';

class AuthenticationService {
  // 1
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  // 2
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  // 3
  Future<String> signIn({String email, String password}) async {
    try {
      EasyLoading.show();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      EasyLoading.dismiss();
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  // 4
  Future<String> signUp(
      {String phone, String name, String email, String password}) async {
    try {
      EasyLoading.show();
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        FirebaseFirestore.instance
            .collection('UserData')
            .doc(value.user.uid)
            .set({
          "email": value.user.email,
          "name": name,
          "phone number": phone,
        });
      });
      EasyLoading.dismiss();
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  // 5
  Future<String> signOut() async {
    try {
      EasyLoading.show();
      await _firebaseAuth.signOut();
      EasyLoading.dismiss();
      return "Signed out";
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

// 6
  User getUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      return null;
    }
  }
}

CollectionReference users = FirebaseFirestore.instance.collection('UserData');

Future<void> updateUserName(String newname) {
  return users
      .doc('$uid')
      .update({'name': newname})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> updateUserPhone(String newphone) {
  return users
      .doc('$uid')
      .update({'phone number': newphone})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
