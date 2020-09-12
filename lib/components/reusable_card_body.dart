import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCardBody extends StatelessWidget {
  final String cardBodyText;
  final IconData cardBodyIcon;
  ReusableCardBody({@required this.cardBodyText, @required this.cardBodyIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardBodyIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardBodyText,
          style: kCardLabelText,
        )
      ],
    );
  }
}
