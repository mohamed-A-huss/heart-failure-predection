import 'package:flutter/material.dart';
import './Animation/FadeAnimation.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
                      percent: 0.7,
                      center:  Text(
                        "70.0%",
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
                   ),



                  Padding(
                    padding: const EdgeInsets.only(top:150.0),
                    child: FadeAnimation(
                      1,
                      GestureDetector(
                        onTap: (){
                          //take the data
                          // check empty data



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
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
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
