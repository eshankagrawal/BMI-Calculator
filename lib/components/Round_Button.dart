import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onpress;
  RoundButton({this.icon,this.onpress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon) ,
      onPressed: onpress,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


