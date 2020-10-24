import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import  'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Icon_content.dart';
import '../components/Reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/roundicon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female,
}
class _InputPageState extends State<InputPage> {
  //Color maleCardColour=inactiveCardColor;
  //Color femaleCardColour=inactiveCardColor;
 Gender selectedGender;
 int height=180;
 int weight=60;
 int age=15;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[//Here i have to create a new Function(in the Reusable_card.dart) name to use in the Input.
              Expanded(child: ReusableCard(onPress: (){
                setState(() {
                  selectedGender=Gender.male;
                });
              },
                cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                colour:selectedGender==Gender.male?kActiveCardColor:kInactiveCardColor,
              ),),
              Expanded(child: ReusableCard(onPress: (){
                setState(() {
                  selectedGender=Gender.female;
                });
              },
                cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                colour:selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
                ),),
            ],
          ),),
          Expanded(child: ReusableCard(colour: kActiveCardColor,
          cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('HEIGHT',style: kLabelTextStyle,),
              SizedBox(width: 20.0,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(height.toString(),style: kULabelTextStyle,),
                Text('cm',style: kLabelTextStyle,),
                ],
              ),
              SliderTheme(data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor:  Color(0xFF8D8E98),
                thumbColor: Color(0xFFEB1555),
                overlayColor:Color(0x29EB1555) ,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 15.0,
                ),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0,),
              ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 200.0,
                 onChanged: (double newValue){
                 setState(() {
                   height=newValue.round();
                 });
                 },
                ),
              ),
            ],
          ),),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('WEIGHT',style: kLabelTextStyle,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(weight.toString(),style: kULabelTextStyle,),
                      Text('kg',style: kLabelTextStyle,),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       RoundIconButton(icon: FontAwesomeIcons.minus,
                        // here i was unable to update;
                           //I have to pass a function.
                           onChanged: (){
                        setState(() {
                          weight--;
                        });
                         }),
                      SizedBox(width: 10.0,),
                      RoundIconButton(icon: FontAwesomeIcons.plus,
                      onChanged: (){
                        setState(() {
                          weight++;
                        });
                      },),
                    ],
                  ),
                ],
              ),
              ),),

              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',style: kLabelTextStyle,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(age.toString(),style: kULabelTextStyle,),
                        Text('Year',style: kLabelTextStyle,)
                      ],
                    ),
                 Row(
                   children: <Widget>[
                     RoundIconButton(icon: FontAwesomeIcons.minus,
                     onChanged: (){
                       setState(() {
                         age--;
                       });
                     },),
                     SizedBox(width: 10.0,),
                     RoundIconButton(icon: FontAwesomeIcons.plus,
                     onChanged: (){
                       setState(() {
                         age++;
                       });
                     },),
                   ],
                 ),

                  ],
                ),

                colour: kActiveCardColor,),),
            ],
          ),),
        BottomButton(bottomTitleText: 'CALCULATE',onPress: (){
          CalculatorBrain cal=CalculatorBrain(height: height,weight: weight);
          cal.calculateBMI();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
            bmiResult: cal.calculateBMI(),
            textResult: cal.getResult().toUpperCase(),
            interpretation: cal.getInterpretation(),
          )));
        },),
        ],
      ),
    );
  }
}






