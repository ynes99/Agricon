import 'package:firebasetest/constants/constants.dart';
import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingAction(),
      backgroundColor: kCouleurScaffold,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Color(0xFFCFEEC4),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Rencontrer l\'équipe',
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
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.grey,
                        width: 4.0,
                      ),
                    ),
                    child: CircleAvatar(
                      foregroundImage:
                          AssetImage('assets/images/image_equipe (2).jpg'),
                      radius: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Ines Bouhelal',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('e-mail: ines.bouhelal@ensi-uma.tn'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Divider(
                    endIndent: 30,
                    indent: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.grey,
                        width: 4.0,
                      ),
                    ),
                    child: CircleAvatar(
                      foregroundImage:
                          AssetImage('assets/images/image_equipe (1).jpg'),
                      radius: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Ichrak Hamdi',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('e-mail: ichrak.hamdi@ensi-uma.tn'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Divider(
                    endIndent: 30,
                    indent: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
