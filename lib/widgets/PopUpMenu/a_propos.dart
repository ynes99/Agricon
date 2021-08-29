import 'package:firebasetest/constants/constants.dart';
import 'package:flutter/material.dart';

class A_Propos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingAction(),
      body: Padding(
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
          child: ListView(
            children: [
              Card(
                color: Color(0xFFCFEEC4),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'Qui Sommes Nous ?',
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
              RichText(
                text: TextSpan(
                  style: new TextStyle(
                    wordSpacing: 3,
                    fontFamily: 'Stix',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'AGGRICUS',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                        text:
                            ' est une plateforme électronique de commercialisation des produits agricoles, locaux et artisanaux tunisiens.\n\nElle oeuvre dans le cadre d\'un accord de coopération entre le Pôle Technologique de Manouba et l\'Organisation pour l\'Agriculture et l\'Alimentation.\n'),
                    TextSpan(
                      text: '\nNotre Mission:\n',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                        text:
                            '\t-Digitaliser la vente des produits agricoles, locaux et artisanaux.\n'
                            '\t-Faciliter l\'accès aux marchés locaux et internationaux.\n'
                            '\t-Industrie du contenu numérique pour promouvoir les marques tunisiennes.'),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: new TextStyle(
                    wordSpacing: 3,
                    fontFamily: 'Stix',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: '\nNos Principes :\n',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text:
                          '\t-Création collective : l\'écoute des besoins de nos clients est la raison de notre développement.\n'
                          '\t-Confiance : La confiance du client est notre capital.\n'
                          '\t-Qualité : L\'assurance qualité des produits est une nécessité, pas une option',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                indent: 25,
                endIndent: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.description),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Tunis 4710-4890 '),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                indent: 25,
                endIndent: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('contact@aggricus.com'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                indent: 25,
                endIndent: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('tel:(08)23456789'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
