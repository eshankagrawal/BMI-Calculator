import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/components/Icon_Content.dart';
import 'package:bmicalculator/components/Reusable_Card.dart';
import '../Constant.dart';
import '../components/bottom_button.dart';
import '../components/Round_Button.dart';
import 'package:bmicalculator/calculator_brain.dart';
import 'result_page.dart';
enum GenderType { male, female }
int height=180;
int newvalue;
int weight=60;
int age=18;


class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  // Color malecardcolor=inactivecolor;
  // Color femalecardcolor=inactivecolor;
  GenderType Selectedgender;
  /* void updateColor(GenderType gender){
    if(gender==GenderType.male)
      {
        if(malecardcolor==inactivecolor) {
          malecardcolor = activecolor;
          femalecardcolor=inactivecolor;
        }
        else
          malecardcolor=inactivecolor;
      }
    if(gender==GenderType.female)
      {
        if(femalecardcolor==inactivecolor) {
          femalecardcolor = activecolor;
          malecardcolor=inactivecolor;
        }
        else
          femalecardcolor=inactivecolor;
      }

  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR",style: TextStyle(fontSize: 28.0),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    press: () {
                      setState(() {
                        Selectedgender = GenderType.male;
                      });
                    },
                    colour: Selectedgender == GenderType.male ? kactivecolor : kinactivecolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.male,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    press: () {
                      setState(() {
                        Selectedgender = GenderType.female;
                      });
                    },
                    colour: Selectedgender == GenderType.female ? kactivecolor : kinactivecolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.female,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: kactivecolor,
            cardchild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(child: Text("Height",style: kstyle,)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),style: kastyle,),
                    Text("cm",style: kstyle,)
                  ],
                ),
                SliderTheme(
                  data:SliderTheme.of(context).copyWith(

                    overlayColor: Color(0xFFEB1555),
                    thumbColor: Color(0x40EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0)
                  ),
                  child: Slider(value: height.toDouble(),
                    min: 120,
                    max: 330,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue){
                    setState(() {
                      height=newvalue.round();
                    });

                    },

                  ),
                )
              ],
            ),),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kactivecolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Weight",style: kstyle,),
                      Text(weight.toString(),style: kastyle,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(icon: FontAwesomeIcons.minus,
                          onpress: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundButton(icon: FontAwesomeIcons.plus,
                            onpress: (){
                              setState(() {
                                weight++;
                              });
                            },),
                        ],
                      )
                    ],
                  )),
                ),
                Expanded(
                  child: ReusableCard(colour: kactivecolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Age",style: kstyle,),
                          Text(age.toString(),style: kastyle,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(icon: FontAwesomeIcons.minus,
                                onpress: (){
                                  setState(() {
                                    age--;
                                  });
                                },),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundButton(icon: FontAwesomeIcons.plus,
                                onpress: (){
                                  setState(() {
                                    age++;
                                  });
                                },),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          FlatButton(
            onPressed: (){
             CalculatorBrain calc= CalculatorBrain(height:height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                bmiresult:calc.calcBmi(),
                bmistatus:calc.getResult(),
                bmiinter:calc.getInterpretation(),

              )));
            },
            child: BottomButton(text: Text("calculate",style: kastyle,),),
          )
        ],
      ),
    );
  }
}
