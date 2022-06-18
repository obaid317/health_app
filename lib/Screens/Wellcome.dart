import 'package:flutter/material.dart';
import 'package:health_app/Screens/BasicInfo.dart';
import 'package:health_app/Screens/Module.dart';
import 'package:health_app/Screens/SignIn.dart';
import 'package:health_app/Screens/SignUp.dart';
class Wellcome extends StatefulWidget {
  @override
  _WellcomeState createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        // decoration: BoxDecoration(
        //   image:DecorationImage(
        //     image: AssetImage("asset/welllcome.jpg"),
        //     fit: BoxFit.cover,
        //      colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.4), BlendMode.lighten),
        //   ),
        // ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.15,),
            ClipRRect(
              borderRadius: BorderRadius.zero,
              child:Image(image: AssetImage("asset/logo.png"),
                color: Colors.black,
                height: 80,
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top:190.0,left: 30),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Welcome to the ",style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Mental and Physical\n App's",style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,

                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),


                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding:   EdgeInsets.fromLTRB(0, 90, 0, 10),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width*0.63,
                      height: 45.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),

                        ),
                        color:  Colors.black,

                        onPressed: () async {

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()
                    ));
                        },
                        child: const Text(" "
                            'Sign Up' '',
                          style: TextStyle(fontSize: 15, color: Colors.white),

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:   EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width*0.63,
                      height: 45.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),

                        ),
                        color:  Colors.black,

                        onPressed: () async {

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signin()
                          ));
                        },
                        child: const Text(" "
                            'Sign In' '',
                          style: TextStyle(fontSize: 15, color: Colors.white),

                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ) ,
      ),

    );
  }
}
