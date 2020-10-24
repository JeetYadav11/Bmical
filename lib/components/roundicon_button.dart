import 'package:flutter/material.dart';
import '../constants.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onChanged});
  final IconData icon;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      onPressed:onChanged,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width:56.0,
        height:56.0,
      ),
      shape: CircleBorder(),
      fillColor:Color(0xFF4C4F5E) ,
    );
  }
}
