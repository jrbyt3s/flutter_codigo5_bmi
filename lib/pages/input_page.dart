import 'package:flutter/material.dart';
import 'package:flutter_codigo5_bmi/pages/result_page.dart';
import 'package:flutter_codigo5_bmi/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kTapSelectedColor = Color(0xff232f39);
const kCardColor = Color(0xff1F232C);
const kPrimaryColor = Color(0xffAB4FEE);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedOption = Gender.male;
  int height = 165;
  int weight = 55;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.deepPurple,
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Primera fila
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedOption == Gender.male
                        ? kTapSelectedColor
                        : kCardColor,
                    childCard: IconContent(
                      textIcon: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                    onTap: () {
                      selectedOption = Gender.male;
                      print(selectedOption);
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedOption == Gender.female
                        ? kTapSelectedColor
                        : kCardColor,
                    childCard: IconContent(
                      textIcon: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                    onTap: () {
                      selectedOption = Gender.female;
                      print(selectedOption);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          //Segunda fila
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("HEIGHT     "),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            Text("cm"),
                          ],
                        ),
                        Slider(
                            min: 0,
                            max: 200,
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              height = newValue.round();
                              print(height);
                              setState(() {});
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Tercera fila
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: TextStyle(fontSize: 20)),
                        Text(weight.toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                weight--;
                                setState(() {});
                              },
                            ),
                            InputIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                weight++;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: TextStyle(fontSize: 20)),
                        Text(age.toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                age--;
                                setState(() {});
                              },
                            ),
                            InputIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                age++;
                                setState(() {});
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
          //Bot??n
          NavigatorButton(
            title: "CALCULATE",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage()));
            },
          ),
        ],
      ),
    );
  }
}
