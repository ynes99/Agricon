import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/widgets/PopUpMenu/a_propos.dart';
import 'package:firebasetest/widgets/PopUpMenu/modifier_votre_profil.dart';
import 'package:firebasetest/widgets/PopUpMenu/notre%20%C3%A9quipe.dart';
import 'package:firebasetest/directorypage.dart';
import 'package:firebasetest/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'package:firebasetest/Screens/login signup/seconnecter.dart';
import 'package:firebasetest/Screens/login signup/inscrire.dart';
import 'package:firebasetest/Screens/user screens/splash_screen.dart';
import 'package:firebasetest/Screens/user screens/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        // 2
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        // 3
        StreamProvider(
          create: (context) =>
          context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        title: "Login",
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
              textStyle: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Stix',
              ),
              primary: kCouleurTexte,
              backgroundColor: kCouleurAccent,
            ),
          ),
          primaryColor: fCouleurPrimaire,
          scaffoldBackgroundColor: fCouleurScaffold,
          accentColor: fCouleurAccent,
          fontFamily: 'Stix',
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
              color: fCouleurTexte,
            ),
            headline3: TextStyle(
              fontSize: 14.0,
              color: fCouleurTexte,
            ),
            bodyText2: TextStyle(fontSize: 14.0),
          ),
        ),
        initialRoute: Splash_Screen,
        routes: {
          Splash_Screen: (context) => SplashScreen(),
          Sign_in: (context) => SignInPage(),
          Sign_Up: (context) => SignUpScreen(),
          SOnboarding: (context) => Onboarding_page(),
          Auth: (context) => AuthenticationWrapper(),
          Modif: (context) => ModifierVotreProfil(),
          APropos: (context) => A_Propos(),
          Equipe: (context) => Team(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    if (firebaseuser != null) {
      return Directory();
    }
    return SignInPage();
  }
}
