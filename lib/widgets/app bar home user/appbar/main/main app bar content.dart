import 'package:firebasetest/Screens/user screens/homepage/PopUpMenu/a_propos.dart';
import 'package:firebasetest/Screens/user screens/homepage/PopUpMenu/modifier_votre_profil.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebasetest/services/authenticationService.dart';
import 'package:firebasetest/Screens/user screens/homepage/PopUpMenu/notre équipe.dart';

class AppBarContent extends StatefulWidget {
  @override
  _AppBarContentState createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Padding(
                //titre de l'app bar
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Bonjour',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    username(
                      Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/logotiny1.png',
                    height: 40,
                  ),
                  radius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: PopupMenuButton(
                  //le pop up menu dans l'app bar et ses choix
                  onSelected: (value) {
                    switch (value) {
                      case 0:
                        NextPage(context, ModifierVotreProfil());
                        //redirection vers la page modifier votre profil
                        break;
                      case 1:
                        NextPage(context, A_Propos());
                        //redirection vers la page A Propos
                        break;
                      case 2:
                        NextPage(context, Team());
                        //redirection vers la page Team
                        break;
                      case 3:
                        context.read<AuthenticationService>().signOut();
                        //deconnexion et redirection vers sign in
                        break;
                    }
                  },
                  elevation: 6,
                  shape: OutlineInputBorder(
                      // esthetique du pop up menu
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  itemBuilder: (context) => [
                    // esthetique du pop up menu
                    PopupMenuItem(
                      child: MenuItem(
                        texte: Text("Modifier votre profil"),
                        icone: Icon(Icons.edit),
                      ),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: MenuItem(
                        texte: Text("A propos d'Aggricus"),
                        icone: Icon(Icons.account_circle),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: MenuItem(
                        texte: Text("Notre équipe"),
                        icone: Icon(Icons.groups),
                      ),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: MenuItem(
                        texte: Text("Se Déconnecter"),
                        icone: Icon(Icons.logout),
                      ),
                      value: 3,
                    ),
                  ],
                  icon: Icon(
                    Icons.menu_outlined,
                    color: fCouleurTexte,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({@required this.icone, @required this.texte});
  final Icon icone;
  final Widget texte;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icone,
        SizedBox(
          width: 20,
        ),
        texte,
      ],
    );
  }
}

void NextPage(context, Widget page) {
  //animation des transitions de page
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
}
