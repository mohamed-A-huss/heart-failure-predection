import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';
import 'package:heartfailurepredictor/Screens/ResultScreen.dart';
import 'package:heartfailurepredictor/Screens/RegressionData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
Text textnormal= Text('High Blood Pressure',style: TextStyle(
    color: Colors.grey,
    fontSize: 15
),);
Text textred=Text('Choose High Blood Pressure Condition',style: TextStyle(color: Colors.red,fontSize: 15),);
Text highbloodtext=textnormal;
String url;
int efracdata;
int hbpdata;




class HeartData extends StatefulWidget {
  static const String id = 'heart data';
  @override
  _HeartDataState createState() => _HeartDataState();
}

class _HeartDataState extends State<HeartData> {
  final _textejf = TextEditingController();
  bool _validateejf = false;
  String _chosenHBP;
  @override
  void dispose() {
    _textejf.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff21254A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: kIsWeb?AssetImage("assets/images/2.png") :AssetImage("assets/images/1.png"),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "Heart Condition",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5
                    ,
                  ),
                  FadeAnimation(
                    1,
                    Text(
                      "Please enter your data below",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color(0xff6e697e),
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  FadeAnimation( 1,
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,
                      ),
                      child: Column(

                        mainAxisAlignment:  MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: TextField(
                               controller: _textejf,
                                keyboardType: TextInputType.number,

                                onChanged: (value){
                                  setState(() {
                                    efracdata=int.parse(value);
                                  });
                                },
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                decoration: InputDecoration(
                                  errorText: _validateejf ? 'Value Can\'t Be Empty' : null,
                                  border: InputBorder.none,
                                  hintText: "Ejection fraction (percentage)",
                                  hintStyle: TextStyle(color: Colors.grey,),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              child: DropdownButtonHideUnderline(

                                child: DropdownButton<String>(
                                  icon: Icon(                // Add this
                                    Icons.arrow_drop_down,  // Add this
                                    color: Colors.grey,   // Add this
                                  ),
                                  iconDisabledColor: Colors.grey,
                                  isExpanded: true,
                                  dropdownColor: Color(0xff21254A) ,
                                  focusColor:Colors.white,
                                  value: _chosenHBP,
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor:Colors.black,
                                  items: <String>[
                                    'High Blood Pressure: Yes',
                                    'High Blood Pressure: No',

                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      onTap: (){
                                        if(value=='High Blood Pressure: Yes'){
                                          hbpdata=1;

                                        }else if(value== 'High Blood Pressure: No'){
                                          hbpdata=0;
                                        }

                                      },

                                      value: value,

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 9.0),
                                        child: Text(value,style:TextStyle(color:Colors.white),),
                                      ),
                                    );
                                  }).toList(),
                                  hint:Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: highbloodtext
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _chosenHBP = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 6,
                            thickness: 2,

                            endIndent: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:150.0),
                    child: FadeAnimation(
                      1,
                      GestureDetector(
                        onTap: ()async{


                          setState(() {
                            if(_textejf.text.isEmpty){
                              _validateejf = true;
                            }else{
                              _validateejf = false;
                            }if(hbpdata==null){
                              highbloodtext=textred;
                            }else{
                              highbloodtext=textnormal;
                            }

                          });

                          if( _validateejf == false && hbpdata != null ){
                            patientData["ejection_fraction"]=efracdata;
                            patientData["high_blood_pressure"]=hbpdata;
                            print(patientData);
                            //kIsWeb

                            if(kIsWeb){
                              //web url
                              url='http://127.0.0.1:5000/p';
                            }else{
                              //andriod url
                              url='http://10.0.2.2:5000/p';
                            }
                              final response = await http.post(
                                  url, body: json.encode(
                                  patientData)); //getting the response from our backend server script
                            final decoded = json.decode(response.body) as Map<String, dynamic>; //converting it from json to key value pair
                            setState(() {
                               predection = decoded['name'];

                              print(predection);//changing the state of our widget on data update
                            });
                            diagnosisNotes=diagnosis(patientData["ejection_fraction"],patientData["platelets"] ,patientData["serum_creatinine"] ,patientData["serum_sodium"] );
                            if(response.statusCode==200){
                              Navigator.pushNamed(context, Result.id);
                            }
                          }

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
                              "Next",
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
