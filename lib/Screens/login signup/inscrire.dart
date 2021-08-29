import 'package:firebasetest/main.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/constants/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/widgets/app bar login/custom_shape.dart';
import '/widgets/app bar login/customappbar.dart';
import '/widgets/app bar login/responsive_ui.dart';
import 'package:firebasetest/services/helper.dart';
import 'package:provider/provider.dart';
import 'package:firebasetest/services/authenticationService.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();

  bool checkBoxValue = false;
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),
                // acceptTermsTextRow(),
                SizedBox(
                  height: 33,
                ),
                button(),
                // infoTextRow(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
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
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
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
        // Container(
        //   height: _height / 5.5,
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //           spreadRadius: 0.0,
        //           color: Colors.black26,
        //           offset: Offset(1.0, 10.0),
        //           blurRadius: 20.0),
        //     ],
        //     color: Colors.white,
        //     shape: BoxShape.circle,
        //   ),
        //   child: GestureDetector(
        //       onTap: () {
        //         print('Ajouter photo');
        //       },
        //       child: Icon(
        //         Icons.add_a_photo,
        //         size: _large ? 40 : (_medium ? 33 : 31),
        //         color: kIconTapped,
        //       )),
        // ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
            SizedBox(
              height: _height / 60.0,
            ),
            signInTextRow()
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Nom de l\'utilisateur',
      ),
      controller: nameTextController,
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        icon: Icon(Icons.email),
        hintText: 'E-mail',
      ),
      controller: emailTextController,
    );
  }

  Widget phoneTextFormField() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        icon: Icon(Icons.phone),
        hintText: 'phone',
      ),
      controller: phoneTextController,
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
        enableSuggestions: false,
        autocorrect: false,
        obscureText: true,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          icon: Icon(Icons.lock),
          hintText: "Mot de passe",
        ),
        controller: passwordTextController);
    // return TextField(

    //   controller: passwordTextController,
    //   decoration: InputDecoration(

    //   ),
    // );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: kCouleurAccent,
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "J'accepte tous les termes et conditions",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return ElevatedButton(
      onPressed: () async {
        if (nameTextController.text.isNotEmpty &&
            emailTextController.text.isNotEmpty &&
            passwordTextController.text.isNotEmpty &&
            phoneTextController.text.isNotEmpty) {
          final result = await context.read<AuthenticationService>().signUp(
                phone: phoneTextController.text.trim(),
                name: nameTextController.text.trim(),
                email: emailTextController.text.trim(),
                password: passwordTextController.text.trim(),
              );
          showSnackbar(context, result);

          if (result == "Signed up") {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AuthenticationWrapper(),
              ),
              (route) => false,
            );
          }
        } else {
          EasyLoading.showError(
              'Veuillez remplir tout les champs correctement.');
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          'S\'inscrire',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[900],
          ),
        ),
      ),
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

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "ou créer en utilisant les réseaux sociaux",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Vous avez déja un compte ?",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, Sign_in);
              print("Routing to Sign up screen");
            },
            child: Text(
              "s'identifier",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: kIconTapped,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
