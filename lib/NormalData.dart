import 'package:flutter/material.dart';
import './Animation/FadeAnimation.dart';
import 'package:heartfailurepredictor/BloodDataScreen.dart';


class PersonalDatascreen extends StatefulWidget {
  static const String id = 'personalScreen';
  @override
  _PersonalDatascreenState createState() => _PersonalDatascreenState();
}

class _PersonalDatascreenState extends State<PersonalDatascreen> {
  String _chosenGender;
  String _chosenSmoker;
  String _chosenDiabetes;

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
                                  color: Colors.grey[100],
                                ),
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Age",
                                hintStyle: TextStyle(color: Colors.grey,),
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
                                    'Male',
                                    'Female',

                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(

                                      value: value,

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 9.0),
                                        child: Text(value,style:TextStyle(color:Colors.white),),
                                      ),
                                    );
                                  }).toList(),
                                  hint:Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Text(
                                      "Gender",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                         ),
                                    ),
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
                            color: Colors.grey,
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
                                    'Yes',
                                    'No',

                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(

                                      value: value,

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 9.0),
                                        child: Text(value,style:TextStyle(color:Colors.white),),
                                      ),
                                    );
                                  }).toList(),
                                  hint:Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Text(
                                      "Smoker",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    ),
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
                            color: Colors.grey,
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
                                    'Yes',
                                    'No',

                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(

                                      value: value,

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 9.0),
                                        child: Text(value,style:TextStyle(color:Colors.white),),
                                      ),
                                    );
                                  }).toList(),
                                  hint:Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Text(
                                      "Diabetes",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    ),
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
                            color: Colors.grey,
                            height: 6,
                            thickness: 2,

                            endIndent: 2,
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
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
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
                        //take the data
                        // check empty data

                        Navigator.pushNamed(context, BloodData.id);

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
