import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_card_body.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomBtnPinkishColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    bgColour: activeCardColor,
                    cardChild: ReusableCardBody(
                      cardBodyIcon: FontAwesomeIcons.mars,
                      cardBodyText: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColour: activeCardColor,
                    cardChild: ReusableCardBody(
                        cardBodyText: 'Female',
                        cardBodyIcon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              bgColour: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    bgColour: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColour: activeCardColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: bottomBtnPinkishColor,
            width: double.infinity,
            height: 80.0,
            margin: EdgeInsets.only(top: 10.0),
          )
        ],
      ),
    );
  }
}
