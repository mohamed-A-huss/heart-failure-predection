import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';
import 'package:heartfailurepredictor/Screens/BloodDataScreen.dart';
import 'package:heartfailurepredictor/Screens/RegressionData.dart';

Text smokertextnormal= Text('Smoker',style: TextStyle(
    color: Colors.grey,
    fontSize: 15
),);
Text diabetstextnormal= Text('Diabets',style: TextStyle(
    color: Colors.grey,
    fontSize: 15
),);
Text gendertextnormal= Text('Gender',style: TextStyle(
    color: Colors.grey,
    fontSize: 15
),);
Text gendertextred=Text('Choose Gender',style: TextStyle(color: Colors.red,fontSize: 15),);
Text diabetstextred=Text('Choose Diabets Condition',style: TextStyle(color: Colors.red,fontSize: 15),);
Text smokertextred=Text('Choose Smoking Condition',style: TextStyle(color: Colors.red,fontSize: 15),);
Text smokertext=smokertextnormal;
Text diabetstext=diabetstextnormal;
Text gendertext=gendertextnormal;


int agedata;
int smokerdata;
int diabetsdata;
int genderdata;
int followudata;
class PersonalDatascreen extends StatefulWidget {
  static const String id = 'personalScreen';
  @override
  _PersonalDatascreenState createState() => _PersonalDatascreenState();
}
TextEditingController agecont;
Color emptyfield=Colors.red;
Color normalField=Colors.grey[100];

Color agecolor=normalField;
Color smokecolor=normalField;
Color gendercolor=normalField;
Color diabetescolor=normalField;
Color followucolor=normalField;
class _PersonalDatascreenState extends State<PersonalDatascreen> {
  final _textage = TextEditingController();
  final _texttime = TextEditingController();
  bool _validateage = false;
  bool _validatetime = false;
  String _chosenGender;
  String _chosenSmoker;
  String _chosenDiabetes;

  @override
  void dispose() {
    _textage.dispose();
    _texttime.dispose();

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
                              image: AssetImage("assets/images/1.png"),
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
                      "Personal Data",
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
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: agecolor,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _textage,
                                keyboardType: TextInputType.number,

                              onChanged: (value){
                                setState(() {
                                  agedata=int.parse(value);
                                });
                              },
                              style: TextStyle(
                                color: Colors.white
                              ),
                              decoration: InputDecoration(
                                errorText: _validateage ? 'Value Can\'t Be Empty' : null,
                                border: InputBorder.none,
                                hintText: "Age",
                                hintStyle: TextStyle(color: Colors.grey),
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
                                  value: _chosenGender,
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor:Colors.black,
                                  items: <String>[
                                    'Gender: Male',
                                    'Gender: Female',

                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      onTap: (){
                                        if(value=='Gender: Male'){
                                          genderdata=1;

                                        }else if(value== 'Gender: Female'){
                                          genderdata=0;
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
                                    child:gendertext
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _chosenGender = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: gendercolor,
                            height: 6,
                            thickness: 2,

                            endIndent: 2,
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
                                  value: _chosenSmoker,
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor:Colors.black,
                                  items: <String>[
                                    'Smoker: Yes',
                                    'Smoker: No',

                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      onTap: (){
                                        if(value=='Smoker: Yes'){
                                          smokerdata=1;

                                        }else if(value== 'Smoker: No'){
                                          smokerdata=0;
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
                                    child: smokertext
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _chosenSmoker = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: smokecolor,
                            height: 6,
                            thickness: 2,

                            endIndent: 2,
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
                                  value: _chosenDiabetes,
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor:Colors.black,
                                  items: <String>[
                                    'Diabetes: Yes',
                                    'Diabetes: No',

                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      onTap: (){
                                        if(value=='Diabetes: Yes'){
                                          diabetsdata=1;

                                        }else if(value== 'Diabetes: No'){
                                          diabetsdata=0;
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
                                    child: diabetstext
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _chosenDiabetes = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: diabetescolor,
                            height: 6,
                            thickness: 2,

                            endIndent: 2,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10.0,left: 10.0,bottom: 10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: followucolor,
                                ),
                              ),
                            ),
                            child: TextField(
                                keyboardType: TextInputType.number,
                              controller: _texttime,

                              onChanged: (value){
                                followudata=int.parse(value);
                              },
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                errorText: _validatetime ? 'Value Can\'t Be Empty' : null,
                                border: InputBorder.none,
                                hintText: "Follow Up Time (In Days)",
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
                    if(_textage.text.isEmpty){
                      _validateage = true;
                    }else{
                      _validateage = false;
                    }
                    if(_texttime.text.isEmpty){
                      _validatetime = true;
                    }else{
                      _validatetime = false;
                    }if(_chosenGender==null){
                      gendertext=gendertextred;
                    }else{
                      gendertext=gendertextnormal;
                    }
                    if(_chosenSmoker==null){
                      smokertext=smokertextred;
                    }else{
                      smokertext=smokertextnormal;
                    }
                    if(_chosenDiabetes==null){
                      diabetstext=diabetstextred;
                    }else{
                      diabetstext=diabetstextnormal;
                    }

                    if((_validateage == false )&&( _validatetime == false)&&(_chosenGender!=null)&&(_chosenSmoker!=null)&&(_chosenDiabetes!=null) ){
                      patientData["age"]=agedata;
                      patientData["smoking"]=smokerdata;
                      patientData["diabetes"]= diabetsdata;
                      patientData["sex"]= genderdata;
                      patientData["time"]= followudata;
                      print(agedata);
                      print(smokerdata);
                      print(diabetsdata);
                      print(genderdata);
                      print(followudata);
                      Navigator.pushNamed(context, BloodData.id);
                    }

                   // Navigator.pushNamed(context, BloodData.id);
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
