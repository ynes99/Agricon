import 'package:expandable_text/expandable_text.dart';
import 'package:firebasetest/constants/constants.dart';
import 'package:firebasetest/widgets/app bar home user/appbar/secondary/app bar simple.dart';
import 'package:flutter/material.dart';

class Partenaires extends StatefulWidget {
  @override
  _PartenairesState createState() => _PartenairesState();
}

class _PartenairesState extends State<Partenaires> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Material(
          elevation: 5,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF91DC3B),
                  Color(0xFF91DC3B),
                  Color(0xFFCAADAD),
                  Color(0xFFCAADAD)
                ],
              ),
            ),
            child: SimpleBar(
              titre: 'Partenaires',
            ),
          ),
        ),
      ),
      body: Center(
        child: Scaffold(
          backgroundColor: kCouleurScaffold,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Element(asset: 'assets/images/FAKE DESIGNS(1).png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Element(asset: 'assets/images/FAKE DESIGNS.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Element(asset: 'assets/images/Sans titre.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Element extends StatelessWidget {
  Element({@required this.asset});
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 208,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              asset,
              alignment: Alignment.centerLeft,
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Titre :',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 140,
                      child: ExpandableText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet lobortis velit in placerat. Nulla finibus est at massa tempus maximus. Aliquam vitae mi vel velit elementum volutpat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut sodales sit amet risus vitae sollicitudin. Sed porttitor accumsan arcu a fermentum. Pellentesque eleifend enim diam, a rhoncus.',
                        expandText: 'show more',
                        collapseText: 'show less',
                        maxLines: 7,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
