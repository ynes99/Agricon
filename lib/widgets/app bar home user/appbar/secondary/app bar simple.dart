import 'package:flutter/material.dart';

class SimpleBar extends StatelessWidget {
  SimpleBar({@required this.titre});

  final String titre;

  @override
  Widget build(BuildContext context) {
    //app bar esthetique
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '$titre',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
