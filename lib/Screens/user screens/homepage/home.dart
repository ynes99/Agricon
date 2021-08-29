import 'package:expandable_text/expandable_text.dart';

import 'package:firebasetest/services/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/widgets/app bar home user/appbar/main/customappbar.dart';

Color colour1_1 = Colors.grey;
Color colour2_1 = Colors.grey;
Color colour3_1 = Colors.grey;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabController _controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(145),
            child: Column(
              children: [
                CustomAppBar(),
                PreferredSize(
                  preferredSize: new Size(300.0, 300.0),
                  child: TabBar(
                    indicatorColor: Colors.lime,
                    controller: _controller,
                    tabs: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 8, 5, 4),
                              child: Icon(Icons.description),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 2, 5, 8),
                              child: Text(
                                'Nouveauté\ndu Blog',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 8, 5, 4),
                              child: Icon(Icons.park),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 2, 5, 8),
                              child: Text(
                                'Nouveaux\nProduits',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 8, 5, 4),
                              child: Icon(Icons.groups),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 2, 5, 8),
                              child: Text(
                                'Produits\nPopulaires',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Scaffold(
              body: Container(
                child: ListView(
                  children: [
                    ReusableCard(
                      'assets/images/exp1.jpg',
                      IconButton(
                        onPressed: () {
                          setState(() {
                            colour1_1 == Colors.pink
                                ? colour1_1 = Colors.grey
                                : colour1_1 = Colors.pink;
                          });
                        },
                        color: colour1_1,
                        icon: Icon(Icons.favorite),
                      ),
                    ),
                    ReusableCard(
                      'assets/images/exp2.jpg',
                      IconButton(
                        onPressed: () {
                          setState(() {
                            colour2_1 == Colors.pink
                                ? colour2_1 = Colors.grey
                                : colour2_1 = Colors.pink;
                          });
                        },
                        color: colour2_1,
                        icon: Icon(Icons.favorite),
                      ),
                    ),
                    ReusableCard(
                      'assets/images/Landscape-Color.jpg',
                      IconButton(
                        onPressed: () {
                          setState(() {
                            colour3_1 == Colors.pink
                                ? colour3_1 = Colors.grey
                                : colour3_1 = Colors.pink;
                          });
                        },
                        color: colour3_1,
                        icon: Icon(Icons.favorite),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Scaffold(body: List_reusable()),
            Scaffold(
              body: List_reusable(),
            ),
          ],
        ),
      ),
    );
  }
}

class List_reusable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card_home(asset: 'assets/images/Sans titre(1).png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card_home(asset: 'assets/images/Sans titre(3).png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card_home(asset: 'assets/images/Sans titre(4).png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card_home(asset: 'assets/images/Sans titre(5).png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card_home(asset: 'assets/images/Sans titre(6).png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card_home(asset: 'assets/images/Sans titre(7).png'),
        ),
      ],
    );
  }
}

class Card_home extends StatelessWidget {
  Card_home({@required this.asset});
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
                      'Prix : 99.99Dt',
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
