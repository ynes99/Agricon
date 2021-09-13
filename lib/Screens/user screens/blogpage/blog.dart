import 'package:firebasetest/widgets/app bar home user/appbar/secondary/app bar simple.dart';
import 'package:firebasetest/services/ReusableCard.dart';
import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  //page contenant les articles du blog
  @override
  _BlogState createState() => _BlogState();
}

Color colour1 = Colors.grey;
Color colour2 = Colors.grey;
Color colour3 = Colors.grey;

class _BlogState extends State<Blog> {
  String title = 'Articles';

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
                colors: <Color>[
                  Color(0xFFCAADAD),
                  Color(0xFF91DC3B),
                  Color(0xFF91DC3B),
                  Color(0xFFCAADAD)
                ],
              ),
            ),
            child: SimpleBar(
              titre: 'Articles',
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          //liste des postes du blog
          children: [
            ReusableCard(
              'assets/images/exp1.jpg',
              IconButton(
                onPressed: () {
                  setState(() {
                    colour1 == Colors.pink
                        ? colour1 = Colors.grey
                        : colour1 = Colors.pink;
                  });
                },
                color: colour1,
                icon: Icon(Icons.favorite),
              ),
            ),
            ReusableCard(
              'assets/images/exp2.jpg',
              IconButton(
                onPressed: () {
                  setState(() {
                    colour2 == Colors.pink
                        ? colour2 = Colors.grey
                        : colour2 = Colors.pink;
                  });
                },
                color: colour2,
                icon: Icon(Icons.favorite),
              ),
            ),
            ReusableCard(
              'assets/images/Landscape-Color.jpg',
              IconButton(
                onPressed: () {
                  setState(() {
                    colour3 == Colors.pink
                        ? colour3 = Colors.grey
                        : colour3 = Colors.pink;
                  });
                },
                color: colour3,
                icon: Icon(Icons.favorite),
              ),
            )
          ],
        ),
      ),
    );
  }
}
