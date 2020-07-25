import 'package:bmicalculator/Constant.dart';
import 'package:bmicalculator/components/Reusable_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';


class ResultPage extends StatelessWidget {
 ResultPage({@required this.bmistatus,@required this.bmiresult,@required this.bmiinter});
  final String bmiresult;
  final String bmistatus;
  final String bmiinter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(padding: EdgeInsets.all(15.0),child: Text("YOUR RESULT",style: ktitle,textAlign: TextAlign.center,))),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: kactivecolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(bmistatus,style: ktext,),
                  Text(bmiresult,style: ktext1),
                  Text(bmiinter,style: ktext2,),
                ],
              ),
            ),
          ),
           GestureDetector(
             onTap: (){
               Navigator.pop(context,'/');
             },
             child: BottomButton(text: Text("Re-calculate",style: kastyle,)),
           )
        ],
      ),
    );
  }
}
