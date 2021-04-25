import 'package:flutter/material.dart';
import 'package:heartfailurepredictor/Screens/NormalData.dart';
import 'package:heartfailurepredictor/Screens/BloodDataScreen.dart';
import 'package:heartfailurepredictor/Screens/HeartCond.dart';
import 'package:heartfailurepredictor/Screens/ResultScreen.dart';
void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PersonalDatascreen.id,
      routes: {
        PersonalDatascreen.id: (context) => PersonalDatascreen(),
        BloodData.id: (context) => BloodData(),
        HeartData.id: (context) => HeartData(),
        Result.id: (context) => Result(),
        // LoginScreen.id: (context) => LoginScreen(),

      },
    );
  }
}