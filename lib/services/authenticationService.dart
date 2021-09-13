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
    //authentification de l'utilisateur
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
    //inscription de l'utlisateur
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
    //deconnexion de l'utilisateur'
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
    //appel a l'instance qui represente l'utilisateur courant
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      return null;
    }
  }
}

CollectionReference users = FirebaseFirestore.instance.collection('UserData');
//reference de la collection ou on stocke les informations de l'utilisateur dans Firebase
Future<void> updateUserName(String newname) {
  //mettre à jour dans la bd le nom de l'utilisateur
  return users
      .doc('$uid')
      .update({'name': newname})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> updateUserPhone(String newphone) {
  //mettre à jour dans la bd le numero de telephone de l'utilisateur
  return users
      .doc('$uid')
      .update({'phone number': newphone})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
