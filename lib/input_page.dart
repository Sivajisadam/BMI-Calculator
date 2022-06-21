import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reUsable_card.dart';
import 'result.dart';
import 'bottom_button.dart';
import 'rounded_icon_button.dart';
import 'calculator_barin.dart';

const inactiveCardColor = Color(0xFF1D1E33);
const activeCardColor = Color.fromARGB(255, 32, 45, 193);

enum Gender {
  male,
  female,
}
// const inactiveCardColor = Colors.yellow;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  int height = 180;
  int weight = 40;
  int age = 18;

  void onTapColor(Gender selectedGender) {
    selectedGender == Gender.male
        ? maleCardColor = activeCardColor
        : maleCardColor = inactiveCardColor;
    selectedGender == Gender.female
        ? femaleCardColor = activeCardColor
        : femaleCardColor = inactiveCardColor;

    // if(selectedGender == Gender.male){
    //   if(maleCardColor == inactiveCardColor){
    //     maleCardColor = activeCardColor;
    //     femaleCardColor = inactiveCardColor;
    //   }else{
    //     maleCardColor = inactiveCardColor;
    //   }
    // }
    // if(selectedGender == Gender.female){
    //   if(femaleCardColor == inactiveCardColor){
    //     femaleCardColor = activeCardColor;
    //     maleCardColor = inactiveCardColor;
    //   }else{
    //     femaleCardColor = inactiveCardColor;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseable(
                    onPress: () {
                      setState(() {
                        onTapColor(Gender.male);
                      });
                    },
                    colour: maleCardColor,
                    cardIcon:
                        iconContent(icon: FontAwesomeIcons.mars, lable: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReUseable(
                    onPress: () {
                      setState(() {
                        onTapColor(Gender.female);
                      });
                    },
                    colour: femaleCardColor,
                    cardIcon: iconContent(
                        icon: FontAwesomeIcons.venus, lable: 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUseable(
              colour: inactiveCardColor,
              cardIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: activeCardColor,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.yellow,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        })
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseable(
                    colour: inactiveCardColor,
                    cardIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'weight',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseable(
                    colour: inactiveCardColor,
                    cardIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'age',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATOR',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResurtPage(
                  bmiResult: calc.calcutateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.gerInterpretation(),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
