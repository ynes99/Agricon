import 'package:flutter/material.dart';
import 'package:firebasetest/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  //app bar personnalise avec du gradient
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height / 10,
        width: width,
        padding: EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            kCouleurPrimaire,
            kCouleurAccent,
          ]),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  print("pop");
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
