import 'package:flutter/material.dart';
import '../Constant.dart';
class BottomButton extends StatelessWidget {
  final Text text;
  BottomButton({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      color: Colors.pink,
      width: double.infinity,
      height: kbottomcontainer,
      alignment: Alignment.center,
      child: text,
    );
  }
}
