import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

Padding ReusableCard(String asset, IconButton iconButton) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
    child: Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.dstATop,
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                asset,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Text(
                  'Title :',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 8),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet lobortis velit in placerat. Nulla finibus est at massa tempus maximus. Aliquam vitae mi vel velit elementum volutpat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut sodales sit amet risus vitae sollicitudin. Sed porttitor accumsan arcu a fermentum. Pellentesque eleifend enim diam, a rhoncus.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 4),
                child: iconButton,
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class CardCute extends StatelessWidget {
  CardCute({@required this.asset, this.iconButton});
  final String asset;
  final IconButton iconButton;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.dstATop,
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                asset,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Text(
                  'Title :',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 8),
                child: Container(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed imperdiet lobortis velit in placerat. Nulla finibus est at massa tempus maximus. Aliquam vitae mi vel velit elementum volutpat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut sodales sit amet risus vitae sollicitudin. Sed porttitor accumsan arcu a fermentum. Pellentesque eleifend enim diam, a rhoncus.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 4),
                child: iconButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}
