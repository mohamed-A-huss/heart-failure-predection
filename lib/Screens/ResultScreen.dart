import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:heartfailurepredictor/Screens/RegressionData.dart';
import 'package:heartfailurepredictor/Screens/NormalData.dart';

class Result extends StatefulWidget {

  static const String id = 'Result data';
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff21254A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   SizedBox(
                       height: 20.0

                         ),
                  Center(
                     child: CircularPercentIndicator(
                       animationDuration: 1000,
                      radius: 150.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: (double.parse(predection.substring(1,predection.length -1))),
                      center:  Text(
                        "${(double.parse(predection.substring(1,predection.length -1))*100).toStringAsFixed(2)}%",
                        style:
                         TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 30.0),
                      ),
                      footer:  Padding(
                        padding: const EdgeInsets.only(top:15.0),
                        child: Text(
                          "Chance of heart failure",
                          style:
                           TextStyle(fontWeight: FontWeight.bold,color: Colors.grey, fontSize: 23.0),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.red,
                   ),
                   )
                  ,SizedBox(
                    height: 122.0,
                  ),
                  Column(
                    children: [
                      Row(children: [
                        Icon(Icons.circle ,color: Colors.white,size: 15,),
                        SizedBox(width: 15.0,),
                        Text(diagnosisNotes[0],style: TextStyle(color: Colors.white,fontSize: 12),)

                      ],),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(children: [
                        Icon(Icons.circle ,color: Colors.white,size: 15,),
                        SizedBox(width: 15.0,),
                        Text(diagnosisNotes[1],style: TextStyle(color: Colors.white,fontSize: 12),)

                      ],),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(children: [
                        Icon(Icons.circle ,color: Colors.white,size: 15,),
                        SizedBox(width: 15.0,),
                        Text(diagnosisNotes[2],style: TextStyle(color: Colors.white,fontSize: 12),)

                      ],),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(children: [
                        Icon(Icons.circle ,color: Colors.white,size: 15,),
                        SizedBox(width: 15.0,),
                        Text(diagnosisNotes[3],style: TextStyle(color: Colors.white,fontSize: 12),)

                      ],),

                    ],
                  )

                  ,Padding(
                    padding: const EdgeInsets.only(top:150.0),
                    child: FadeAnimation(
                      1,
                      GestureDetector(
                        onTap: (){
                          diagnosisNotes.clear();
                          patientData.clear();
                          //take the data
                          // check empty data
                          Navigator.pushNamed(context, PersonalDatascreen.id);

                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromRGBO(49, 39, 79, 1),
                          ),
                          child: Center(
                            child: Text(
                              "Home",
                              style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
