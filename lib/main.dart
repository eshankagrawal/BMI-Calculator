import 'package:bmicalculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'screens/Input_Page.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
     home: Input(),
     /* initialRoute: '/',
      routes: {
        '/':(context)=>Input(),
        '/result':(context)=>ResultPage(),
      },*/
    );
  }
}
