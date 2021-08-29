import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/services/authenticationService.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ModifierVotreProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingAction(),
        backgroundColor: kCouleurScaffold,
        body: FirebaseAuthStuff(),
      ),
    );
  }
}

class FirebaseAuthStuff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
            colorFilter: ColorFilter.mode(
                kCouleurScaffold.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/images/logotiny1.png'),
          ),
          color: kCouleurScaffold,
          borderRadius: BorderRadius.circular(12),
        ),
        child: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Color(0xFFCFEEC4),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Modifier Vos Informations Personnelles:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'Nom Actuel : ',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                    username(TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            TextFormField(
              controller: nameTextController,
              validator: (value) {
                if (value.isEmpty || value == null) {
                  return ('Please enter Some Text.');
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Nom',
                labelText: 'Nouveau Nom',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ButtonValidName(nameTextController, 'Nom modifié'),
            ),
            Divider(
              height: heightdiv,
              indent: indent,
              endIndent: indent,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'Numéro Actuel : ',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                    Numero(
                      Style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            TextFormField(
              onEditingComplete: () {
                print('sus');
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: phoneTextController,
              validator: (value) {
                if (value.isEmpty || value == null) {
                  return ('Please enter Some Text.');
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Nouveau Numéro',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ButtonValidPhone(phoneTextController, 'Numéro modifié'),
            ),
            Divider(
              height: heightdiv,
              indent: indent,
              endIndent: indent,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         Text(
            //           'E-mail Actuel : ',
            //           textAlign: TextAlign.left,
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         e_mail(
            //           Style: TextStyle(fontSize: 16),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // TextFormField(
            //   controller: emailTextController,
            //   validator: (value) {
            //     if (value.isEmpty || value == null) {
            //       return ('Please enter Some Text.');
            //     } else {
            //       return null;
            //     }
            //   },
            //   keyboardType: TextInputType.emailAddress,
            //   decoration: InputDecoration(
            //     icon: Icon(Icons.email),
            //     hintText: 'Nouvelle adresse E-mail',
            //   ),
            // ),
            // Divider(
            //   height: heightdiv,
            //   indent: indent,
            //   endIndent: indent,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  'Un lien de réinitialisation sera envoyé à cet e-mail\npour modifier votre Mot De Passe.',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty || value == null) {
                  return ('Veuillez Remplir tout les champs.');
                } else {
                  return null;
                }
              },
              controller: emailTextController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'E-mail',
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Button(emailTextController),
          ],
        ),
      ),
    );
  }
}

class ButtonValidName extends StatelessWidget {
  ButtonValidName(this.controller, this.msg);
  final TextEditingController controller;
  final String msg;
  void updateName(context, TextEditingController controller, String msg) {
    if (controller.text.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$msg')));
      updateUserName(controller.text);
    } else {
      EasyLoading.showError('Champs Non Valide');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(1),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFCFEEC4)),
      ),
      onPressed: () {
        updateName(context, controller, msg);
      },
      child: const Text(
        'Modifier',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}

class ButtonValidPhone extends StatelessWidget {
  ButtonValidPhone(this.controller, this.msg);
  final TextEditingController controller;
  final String msg;
  void updatePhone(context, TextEditingController controller, String msg) {
    if (controller.text.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$msg')));
      updateUserPhone(controller.text);
    } else {
      EasyLoading.showError('Champs Non Valide');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(1),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFCFEEC4)),
      ),
      onPressed: () {
        updatePhone(context, controller, msg);
      },
      child: const Text(
        'Modifier',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button(this.email);
  final TextEditingController email;
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      EasyLoading.showSuccess('Un E-Mail a été Envoyé!');
    } on FirebaseException {
      EasyLoading.showError('Pas d\'utilisateur trouvé pour ce mail.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(1),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFCFEEC4)),
      ),
      onPressed: () {
        resetPassword();
      },
      child: const Text(
        'Envoyer',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
