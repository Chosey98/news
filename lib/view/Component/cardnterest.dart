import 'package:flutter/material.dart';

import '../../constant.dart';
class CardInterest extends StatelessWidget {
String textnIterest;
String ImageIterest;

  @override
  Widget build(BuildContext context) {
    return   GridTile(

      child: Container(
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(20))),
          child: Image.asset("$ImageIterest")),
      footer: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "$textnIterest",
            style: TextStyle(
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      header: Container(
        color: Colors.transparent,
        width: 40,
        alignment: Alignment.centerRight,
        child: Card(child: Icon(Icons.check)),
      ),
    );
  }

CardInterest({
    required this.textnIterest,
    required this.ImageIterest,
  });
}
