import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Screens/PhysicalFitness.dart';
import 'package:health_app/Services/AuthService.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'Screens/Wellcome.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AuthService a = AuthService();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: a.getCurrentUser(),
            builder:(context, AsyncSnapshot<dynamic> snapshot){
            if(snapshot.hasData){
              return Pfy();
            }
            else{
              return SplashScreen();
            }
            },),

      ));
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Wellcome())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
          ),
          Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child:Image(image: AssetImage("asset/logo.png",),

                    height: 120,
                  ),

                ),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Text("Fitness",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          Container(
            height: 40,
            child: LoadingIndicator(
              indicatorType: Indicator.ballBeat, /// Required, The loading type of the widget
              colors: const [Colors.black],       /// Optional, The color collections
color: Colors.black,
            ),
          )
        ],
      ),

    );
  }
}

