import 'package:flutter/material.dart';
import 'package:heartfailurepredictor/NormalData.dart';
import 'package:heartfailurepredictor/BloodDataScreen.dart';
import 'package:heartfailurepredictor/HeartCond.dart';
import 'package:heartfailurepredictor/ResultScreen.dart';
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