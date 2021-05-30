import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';
import 'package:heartfailurepredictor/Screens/HeartCond.dart';
import 'package:heartfailurepredictor/Screens/RegressionData.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Text textnormal= Text('Anemia',style: TextStyle(
    color: Colors.grey,
    fontSize: 15
),);
Text textred=Text('Choose Anemia Condition',style: TextStyle(color: Colors.red,fontSize: 15),);
Text anemiatext=textnormal;
int anemiadata;
int ckdata;
int ssodiumdata;
int plateletsdata;
double screatidata;
class BloodData extends StatefulWidget {
  static const String id = 'blood data';
  @override
  _BloodDataState createState() => _BloodDataState();
}

class _BloodDataState extends State<BloodData> {
  final _textck = TextEditingController();
  final _textss = TextEditingController();
  bool _validateck = false;
  bool _validatss = false;
  final _textplate = TextEditingController();
  final _textsc = TextEditingController();
  bool _validatplate = false;
  bool _validatsc = false;
  String _chosenAnemia;
  @override
  void dispose() {
    _textck.dispose();
    _textss.dispose();
    _textplate.dispose();
    _textsc.dispose();
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
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "Blood Sample Data",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
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
                          value: _chosenAnemia,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor:Colors.black,
                          items: <String>[
                            'Anemia: Yes',
                            'Anemia: No',

                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              onTap: (){
                                if(value=='Anemia: Yes'){
                                  anemiadata=1;

                                }else if(value== 'Anemia: No'){
                                  anemiadata=0;
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
                            child: anemiatext
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _chosenAnemia = value;
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
                  FadeAnimation( 1,
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,
                      ),
                      child: Column(
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
                            child: TextField(
                              controller: _textck,
                              onChanged: (value){
                                setState(() {

                                  ckdata=int.parse(value);
                                });
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Creatine kinase (mcg/L)",
                                hintStyle: TextStyle(color: Colors.grey,),
                                errorText: _validateck ? 'Value Can\'t Be Empty' : null,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _textss,
                              onChanged: (value){
                                setState(() {

                                  ssodiumdata=int.parse(value);
                                });
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(


                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                errorText: _validatss ? 'Value Can\'t Be Empty' : null,
                                border: InputBorder.none,
                                hintText: "Serum sodium (mEq/L)",
                                hintStyle: TextStyle(color: Colors.grey,),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _textplate,
                              onChanged: (value){
                                setState(() {

                                  plateletsdata=int.parse(value);
                                });
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                errorText: _validatplate ? 'Value Can\'t Be Empty' : null,
                                border: InputBorder.none,
                                hintText: "Platelets (kiloplatelets/mL)",
                                hintStyle: TextStyle(color: Colors.grey,),
                              ),
                            ),
                          ),


                          Container(
                            padding: EdgeInsets.only(right: 10.0,left: 10.0,bottom: 10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _textsc,
                              onChanged: (value){
                                setState(() {
                                  screatidata=double.parse(value);
                                });
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                errorText: _validatsc ? 'Value Can\'t Be Empty' : null,
                                border: InputBorder.none,
                                hintText: "Serum creatinine (mg/dL)",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FadeAnimation(
                    1,
                    GestureDetector(
                      onTap: (){
                      setState(() {
                        if(_textss.text.isEmpty){
                          _validatss = true;
                        }else{
                          _validatss = false;
                        }
                        if(_textck.text.isEmpty){
                          _validateck = true;
                        }else{
                          _validateck = false;
                        }if(_textsc.text.isEmpty){
                          _validatsc = true;
                        }else{
                          _validatsc = false;
                        }
                        if(_textplate.text.isEmpty){
                          _validatplate = true;
                        }else{
                          _validatplate = false;
                        }
                        if(_chosenAnemia==null){
                          anemiatext=textred;
                        }else{
                          anemiatext=textnormal;
                        }

                        if((_validateck == false )&&( _validatss == false)&&(_validatsc == false)&&(_validatplate == false)&&(_chosenAnemia!=null) ){
                          patientData["anaemia"]=anemiadata;
                          patientData["creatinine_phosphokinase"]=ckdata;
                          patientData["serum_sodium"]= ssodiumdata;
                          patientData["platelets"]= plateletsdata;
                          patientData["serum_creatinine"]= screatidata;
                          print(patientData);
                          Navigator.pushNamed(context, HeartData.id);
                        }

                      });







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
