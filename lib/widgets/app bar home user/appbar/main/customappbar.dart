import 'package:flutter/material.dart';
import 'main app bar content.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Positioned(
          top: 0,
          child: Container(
            height: 115,
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
            child: AppBarContent(),
          ),
        ),
      ),
    );
  }
}
