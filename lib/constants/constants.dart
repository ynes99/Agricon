import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const String Sign_in = 'seconnecter';
const String Sign_Up = 'inscrire';
const String Splash_Screen = 'splashscreen';
const String SOnboarding = 'onboarding';
const String Auth = 'auth';
const String Modif = 'Modification';
const String APropos = 'APropos';
const String Equipe = 'Team';
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final uid = user.uid;
double indent = 40;
double heightdiv = 35;
final Color fCouleurPrimaire = Color(0xFF91DC3B);
final Color fCouleurScaffold = Color(0xFFF1F3F0);
final Color fCouleurAccent = Color(0xFFCAADAD);
final Color fCouleurTexte = Color(0xFF222128);
const Color kCouleurPrimaire = Color(0xFF91DC3B);
const Color kCouleurPressed = Color(0xFFE4FADB);
const Color kCouleurScaffold = Color(0xFFF1F3F0);
const Color kCouleurAccent = Color(0xFFCAADAD);
const Color kCouleurBorder = Color(0xFF5B5B5C);
const Color kCouleurTexte = Color(0xFF222128);
const Color kIcon = Color(0xFF222128);
const Color kIconTapped = Color(0xFF315800);
const TextStyle kH1Style = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w900,
  color: kCouleurTexte,
);

class username extends StatefulWidget {
  @override
  _usernameState createState() => _usernameState();
}

class _usernameState extends State<username> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('UserData')
            .doc('$uid')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data;

          return new Text(
            userDocument["name"],
          );
        });
  }
}

username txt = username();

class Numero extends StatefulWidget {
  TextStyle Style;
  Numero({@required this.Style});

  @override
  _NumeroState createState() => _NumeroState();
}

class _NumeroState extends State<Numero> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('UserData')
            .doc('$uid')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data;
          return new Text(
            userDocument["phone number"],
            style: widget.Style,
          );
        });
  }
}

class e_mail extends StatefulWidget {
  TextStyle Style;
  e_mail({@required this.Style});

  @override
  _e_mailState createState() => _e_mailState();
}

class _e_mailState extends State<e_mail> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('UserData')
            .doc('$uid')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data;
          return new Text(
            userDocument["email"],
            style: widget.Style,
          );
        });
  }
}

class FloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kCouleurAccent,
      child: Icon(Icons.keyboard_return),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
