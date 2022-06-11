import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_app/Screens/PhysicalFitness.dart';
import 'package:health_app/Services/Sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';
class GatherInfo extends StatefulWidget {
  @override
  _GatherInfoState createState() => _GatherInfoState();
}

class _GatherInfoState extends State<GatherInfo> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiallize();
  }
  initiallize() async{
    uid= await SharedPreferenceHelper().getUserId();
  }
  final _formKey = GlobalKey<FormState>();
  String age="",height, weight;
 double bmi;
  bool male =true;
  bool female=false;
  double bmr;
  // Basal Metabolic Rate (BMR),1
  // Sedentary: little or no exercise,1.2
  // Light: exercise 1-3 times/week,1.375
  // Moderate: exercise 4-5 times/week,1.465
  // Active: daily exercise or intense exercise 3-4 times/week,1.55
  // Very Active: intense exercise 6-7 times/week,1.725
  // Extra Active: very intense exercise daily, or physical job,1.9
  List<String> _locations = ['Basal Metabolic Rate (BMR)','Sedentary: little or no exercise','Light: exercise 1-3 times/week','Active: daily exercise or intense exercise 3-4 times/week','Moderate: exercise 4-5 times/week','Very Active: intense exercise 6-7 times','Extra Active: very intense exercise daily, or physical job']; // Option 2
  String _selectedLocation; // Option 2

  CollectionReference reference =FirebaseFirestore.instance.collection("usersdata");
  String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child:   Column(
    children: [
          Container(
            
           color: Colors.white,
            child: Container(
  color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.only(top:50.0),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(33),topRight: Radius.circular(33))
  
                    ),
  
                    child: Column(
  
                      children: [
  
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
                          child: Row(
                            children: [
                              Text("Calorie Calculator",style: TextStyle(
                                color: Colors.black,
  fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),),
                            ],
                          ),
                        ),
                        Form(
                            key: _formKey,
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.number,
  
                                    maxLines: 1,
                                    validator: (val) => val.isEmpty ? 'Enter your age' : null,
                                    onChanged: (val) {
                                      setState(() => age = val);
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
  
                                    ),
  
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide(               color: Colors.black
                                             ,width: 2),
                                      ),
                                      labelText: 'Age',
  
                                      labelStyle: TextStyle(
                                        color: Colors.black,
  
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
      SizedBox(height: 10,),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
  
                                    maxLines: 1,
                                    validator: (val) => val.isEmpty ? 'Enter your height' : null,
                                    onChanged: (val) {
                                      setState(() => height = val);
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
  
                                    ),
  
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide(                color: Colors.black,
                                            width: 2),
                                      ),
                                      labelText: 'Height in CM',
  
                                      labelStyle: TextStyle(
                                        color: Colors.black,
  
  
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
  
                                  SizedBox(height: 10,),
                                  TextFormField(
      keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    validator: (val) => val.isEmpty ? 'Enter your weight' : null,
                                    onChanged: (val) {
                                      setState(() => weight = val);
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
  
                                    ),
  
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide(                color: Colors.black,
                                            width: 2),
                                      ),
                                      labelText: 'Weight in KG',
  
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
  
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
  
                                        width: 2,
                                      ) ,                                    borderRadius: BorderRadius.circular(30),
                                    ),
  
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 2),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButton(
                                           isExpanded: true,
  
                                              hint: _selectedLocation==null ?Text('Select Activity Level',style:TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ), overflow: TextOverflow.ellipsis):Text('$_selectedLocation',style: TextStyle(
  
  
                                                fontWeight: FontWeight.bold,
                                                color:  Color.fromARGB(255,177,30,36),
                                              ),overflow: TextOverflow.ellipsis,), // Not necessary for Option 1
                                              value: _selectedLocation,
       underline: Container(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedLocation = newValue;
  
                                                });
                                              },
                                              items: _locations.map((location) {
                                                return DropdownMenuItem(
                                                  child: new Text(location,style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
  
                                                  ),),
                                                  value: location,
                                                );
                                              }).toList(),
  
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                  child: Row(children: [
                                    Text("Gender",style: TextStyle(
                                      color: Colors.black,
                                    ),),
                                    Row(
                                      children: [
                                        Theme(
                                          data: ThemeData(unselectedWidgetColor: Colors.black,
                                          ),
                                          child: Checkbox(hoverColor:                 Colors.black,
                                            activeColor: Colors.transparent,
                                            value: male, onChanged: (checked){
                                            setState((){
                                              male = checked;
                                              female=!male;
                                            });
                                          },  checkColor:  Colors.black,
                                          ),
                                        ),
                                        Text("Male",style: TextStyle(
                                          color: Colors.black,
  
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Theme(
                                          data: ThemeData(unselectedWidgetColor:                Colors.black,
                                          ),
                                          child: Checkbox(value: female,activeColor: Colors.transparent,onChanged: (checked){
                                            setState((){
                                              female = checked;
                                               male=!female;
                                            });
                                          },),
                                        ),
                                        Text("Female",style: TextStyle(
                                          color: Colors.black,
  
                                        ),),
                                      ],
                                    ),
                                  ],
                                  ),
                                ),
  
                                  Padding(
                                    padding:   EdgeInsets.fromLTRB(0, 30, 0, 10),
                                    child: ButtonTheme(
                                      minWidth: MediaQuery.of(context).size.width*0.63,
                                      height: 45.0,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(28.0),
  
                                        ),
                                        color: Colors.black,
  
  
                                        onPressed: () async {
                                          Map<String,dynamic> additems;
  
      if(_formKey.currentState.validate()){
            if(_selectedLocation.isEmpty){
      Fluttertoast.showToast(msg: "Select an Activity Level",backgroundColor: Colors.white,textColor:Color.fromARGB(125,232, 29, 130), toastLength: Toast.LENGTH_LONG);
  
            }
                                          if(male){
                                             additems ={
                                              'uid':uid,'age':age,"height":height,"weight":weight,'actlevel':_selectedLocation,'gender':'male'
                                              ///'username': username,'email': email, 'uid': uid,
                                            };
                                           bmr=(13.397*double.parse(weight) + 4.799*double.parse(height) -(5.677*double.parse(age)) + 88.362) ;
                                               bmi =double.parse(weight)/((0.01*double.parse(height))*(0.01*double.parse(height)));
                                             print("bmi is   "+bmi.toString());
                                          }else{
                                            bmr=(9.247*double.parse(weight) + 3.098*double.parse(height) -( 4.330*double.parse(age)) + 447.593) ;
                                             bmi =double.parse(weight)/((0.01*double.parse(height))*(0.01*double.parse(height)));
                                            print("bmi is   "+bmi.toString());
                                            additems ={
                                              'uid':uid,'age':age,"height":height,"weight":weight,'actlevel':_selectedLocation,'gender':'female','bmr':bmr,"bmi":bmi,
                                              ///'username': username,'email': email, 'uid': uid,
                                            };
                                          }
                                          await reference.add(additems);
SharedPreferences pre = await SharedPreferences.getInstance() ;
pre.setString("bmr", bmr.toString());
pre.setString("bmi", bmi.toString());
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Pfy()));
      }
                                        },
                                        child: const Text(" "
                                            'Continue' '',
                                          style: TextStyle(fontSize: 15, color: Colors.white),
  
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        )
                      ],
  
                    ),
  
                  ),
                ],
              ),
            ),
        ),
      ),
          ),
    ],
  ),
),
    );
  }
}
