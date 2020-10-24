import 'package:bmi_calculator/components/Reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import'package:flutter/material.dart';
import '../components/Reusable_card.dart';
import 'input_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.textResult,@required this.interpretation});
  final bmiResult;
  final textResult;
  final interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style: kTittleTextStyle,),
            ),
          ),
            Expanded(flex:5,
              child:ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(textResult,style: kResultPageTextStyle,),
                    Text(bmiResult,style: kBMITextStyle,),
                    Text(interpretation,
                      textAlign:TextAlign.center,
                      style: kBodyTextStyle,)
                  ],
                ),
     ),
            ),
          BottomButton(bottomTitleText: 'RE-CALCULATE',onPress:(){Navigator.pop(context);},)
        ],
          ),

      );

  }
}
