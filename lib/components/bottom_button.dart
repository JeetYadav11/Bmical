import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPress, @required this.bottomTitleText});
  final String bottomTitleText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(color:kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Text(bottomTitleText,style:kLargeNumberTextStyle,),
        ),
      ),
    );
  }
}