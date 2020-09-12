import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_card_body.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedCard;
  int heightValue = 180;
  int weightValue = 71;
  int ageValue = 26;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onClickHandler: () {
                      setState(() {
                        selectedCard = Gender.male;
                      });
                    },
                    bgColour: selectedCard == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableCardBody(
                      cardBodyIcon: FontAwesomeIcons.mars,
                      cardBodyText: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onClickHandler: () {
                      setState(() {
                        selectedCard = Gender.female;
                      });
                    },
                    bgColour: selectedCard == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
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
              bgColour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kCardLabelText,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heightValue.toString(),
                        style: kCardNumberText,
                      ),
                      Text(
                        'cm',
                        style: kCardLabelText,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8d8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1545),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 14.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28.0)),
                    child: Slider(
                      value: heightValue.toDouble(),
                      min: 100,
                      max: 240,
                      onChanged: (double value) {
                        setState(() {
                          heightValue = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    bgColour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kCardLabelText,
                        ),
                        Text(
                          weightValue.toString(),
                          style: kCardNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRoundIconBtn(
                              icon: FontAwesomeIcons.plus,
                              weightIncrementHandler: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomRoundIconBtn(
                              icon: FontAwesomeIcons.minus,
                              weightIncrementHandler: () {
                                setState(() {
                                  weightValue--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kCardLabelText,
                        ),
                        Text(
                          ageValue.toString(),
                          style: kCardNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRoundIconBtn(
                              icon: FontAwesomeIcons.plus,
                              weightIncrementHandler: () {
                                setState(() {
                                  ageValue++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomRoundIconBtn(
                              icon: FontAwesomeIcons.minus,
                              weightIncrementHandler: () {
                                setState(() {
                                  ageValue--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calBrain =
                  CalculatorBrain(heightValue, weightValue);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calBrain.CalculateBMI(),
                            resultText: calBrain.getResult(),
                            interpretation: calBrain.getInterpretation(),
                          )));
            },
            child: Container(
              color: kBottomBtnPinkishColor,
              width: double.infinity,
              height: 80.0,
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'Calculate',
                  style: kLargeBtnText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomRoundIconBtn extends StatelessWidget {
  final IconData icon;
  final Function weightIncrementHandler;
  CustomRoundIconBtn({@required this.icon, this.weightIncrementHandler});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      elevation: 6.0,
      child: Icon(icon),
      onPressed: weightIncrementHandler,
    );
  }
}
