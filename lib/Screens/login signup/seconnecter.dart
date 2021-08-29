import 'package:firebasetest/constants/constants.dart';
import 'package:firebasetest/Screens/login signup/inscrire.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/widgets/app bar login/custom_shape.dart';
import 'package:firebasetest/widgets/app bar login/responsive_ui.dart';
import 'package:firebasetest/services/helper.dart';
import 'package:provider/provider.dart';
import 'package:firebasetest/services/authenticationService.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              clipShape(),
              welcomeTextRow(),
              SizedBox(
                height: 25.0,
              ),
              signInTextRow(),
              form(),
              SizedBox(height: 16),
              signUpTextRow(),
              SizedBox(
                height: 15,
              ),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return ElevatedButton(
      onPressed: () {
        context
            .read<AuthenticationService>()
            .signIn(
              email: emailTextController.text.trim(),
              password: passwordTextController.text.trim(),
            )
            .then((String result) => showSnackbar(context, result));
      },
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'Se Connecter',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[900],
            ),
          )),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(3.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(kCouleurPrimaire),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kCouleurPrimaire,
                    kCouleurAccent,
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kCouleurPrimaire,
                    kCouleurAccent,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/images/logotiny1.png'),
          ),
          Text(
            "  Aggricus",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large ? 60 : (_medium ? 50 : 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            '                 à votre service!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: emailTextController,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'E-mail',
            ),
          ),
          SizedBox(height: _height / 40.0),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            controller: passwordTextController,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: "Mot de passe",
            ),
          ),
        ],
      ),
    );
  }

  Widget signUpTextRow() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        margin: EdgeInsets.only(top: _height / 120.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Vous n'avez pas de compte ?",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SignUpScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(
                "S'inscrire",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: kIconTapped,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
