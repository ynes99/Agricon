import 'package:firebasetest/constants/constants.dart';
import 'package:onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/main.dart';

class Onboarding_page extends StatelessWidget {
  final onboardingPagesList = [
    PageModel(
      //premiere page de onboarding
      widget: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/images/first_im.png'),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Text(
                      'Bienvenue Dans Agricon!',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Venez rejoindre notre réseau d\'agriculteurs\ncrée par Aggricus',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.bottomLeft,
                  child: Image.asset('assets/images/logotiny1.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    PageModel(
      // deuxieme page introductive
      widget: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/images/second_im.png'),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Text(
                      'Créer Votre Réseau',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Créer de nouvelles liaisons avec nos partenaires\net vendez vos produits chez nous',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.bottomLeft,
                  child: Image.asset('assets/images/logotiny1.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    PageModel(
      //troisieme page introductive
      widget: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/third_im.png'),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Text(
                      'En Savoir Plus',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Elargissez vos connaisances en agriculture\n grâce à nos articles de sensibilisation',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.bottomLeft,
                  child: Image.asset('assets/images/logotiny1.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        //un widget venant d'un package de flutter pub dev permettant de mettre des pages introductives a l'application
        background: Colors.white,
        proceedButtonStyle: ProceedButtonStyle(
          proceedButtonColor: kCouleurPrimaire,
          proceedpButtonText: Text(
            'Se Connecter',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          proceedButtonRoute: (context) {
            return Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 2),
                pageBuilder: (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) =>
                    AuthenticationWrapper(), //redirection vers home ou sign in page selon si il y a un utilisateur connecte ou non
                transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) =>
                    ScaleTransition(
                  //animation de transition entre les pages
                  scale: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: child,
                ), // animation hero if possible
              ),
              (route) => false,
            );
          },
        ),
        pages: onboardingPagesList, //liste des pages introductives
        isSkippable: true,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_uniform,
            ),
          ),
        ),
      ),
    );
  }
}
