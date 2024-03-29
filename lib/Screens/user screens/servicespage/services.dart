import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/constants/constants.dart';
import 'package:firebasetest/widgets/app bar home user/appbar/secondary/app bar simple.dart';
import 'package:firebasetest/widgets/app%20bar%20home%20user/appbar/main/main%20app%20bar%20content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  TextEditingController field = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115.0),
        child: Material(
          elevation: 5,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                //couleut de l'app bar
                colors: <Color>[
                  Color(0xFFCAADAD),
                  Color(0xFFCAADAD),
                  Color(0xFF91DC3B),
                  Color(0xFF91DC3B),
                ],
              ),
            ),
            child: SimpleBar(
              titre: 'Services',
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: WhiteCardReusable(
              margsize: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Voulez-vous achetez une annonce ? Ou bien mettre vos produits sur notre site web ?'
                    '\nenvoyer une demande écrite selon votre besoin!\n ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Envoyer une demande détaillée avec vos informations privées : ',
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Theme(
                    data: ThemeData(
                      focusColor: kCouleurAccent,
                      primaryColor: kCouleurAccent,
                      primaryColorDark: kCouleurAccent,
                    ),
                    child: TextField(
                      controller: field,
                      keyboardType: TextInputType.text,
                      maxLines: 10,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: kCouleurAccent),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: kCouleurAccent),
                        ),
                        labelText: 'Demande',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopupMenuButton(
                        onSelected: (value) {
                          switch (value) {
                            case 0:
                              _showMyDialog1(context, field);
                              break;
                            case 1:
                              _showMyDialog2(context, field);
                              break;
                          }
                        },
                        elevation: 6,
                        shape: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: MenuItem(
                                texte: Text(
                                    "Envoyer Une Demande\nPour Une Annonce"),
                                icone: Icon(Icons.article),
                              ),
                            ),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: MenuItem(
                                texte: Text(
                                    "Envoyer Une Demande\nPour Vos Produits"),
                                icone: Icon(
                                  Icons.production_quantity_limits,
                                ),
                              ),
                            ),
                            value: 1,
                          ),
                        ],
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.send,
                            color: fCouleurAccent,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteCardReusable extends StatelessWidget {
  //interface reutilisable
  WhiteCardReusable({this.margsize, this.cardChild});
  final EdgeInsets margsize;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margsize,
      child: cardChild,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}

void addData1(TextEditingController field) {
  //ajout de la demande a la base de donnee
  FirebaseFirestore.instance.collection("Demandes_Annonces").add(
    {"user": "$uid", "text": field.text},
  );
}

void addData2(TextEditingController field) {
  //ajout de la demande a la base de donnee
  FirebaseFirestore.instance.collection("Demandes_Produits").add(
    {"user": "$uid", "text": field.text},
  );
}

Future<void> _showMyDialog1(context, TextEditingController field) async {
  //alerte pour confirmer la demande
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Attention',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Confirmez l\'envoi de Votre Demande.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Je Confirme',
              style: TextStyle(color: kCouleurAccent),
            ),
            onPressed: () {
              addData1(field);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Annuler'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showMyDialog2(context, TextEditingController field) async {
  //alerte pour confirmer la demande
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Attention',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Confirmez l\'envoi de Votre Demande.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Je Confirme',
              style: TextStyle(color: kCouleurAccent),
            ),
            onPressed: () {
              addData2(field);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Annuler'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
