import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color bgColour;
  final Widget cardChild;
  ReusableCard({@required this.bgColour, this.cardChild}); //constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: bgColour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
