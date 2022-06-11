
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Screens/PhysicalFitness.dart';
import 'package:health_app/Services/AuthService.dart';

import 'loading.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  AuthService auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading= false;
  bool _PasswordShow = true;
  String error = '';
  String email="";
  String password="";
  String username="";
  String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.black,

      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(33),topRight: Radius.circular(33))
              ),
              child:  loading ? Loading() :SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height:  MediaQuery.of(context).size.height*0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Text(

                        "Sign In",style: TextStyle(

                        fontSize: MediaQuery.of(context).size.height*0.05,

                        color: Colors.black,

                        fontWeight: FontWeight.bold,

                      ),

                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child:  Container(
                          padding: EdgeInsets.all(12),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  maxLines: 1,
                                  validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),

                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.mail,           color: Colors.black,),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(             color: Colors.black,width: 3),
                                    ),
                                    labelText: 'Email',

                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 26,),


                                TextFormField(
                                  maxLines: 1,
                                  validator: (val) => val.isEmpty ? 'Enter a password' : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  obscureText: _PasswordShow,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(Icons.lock,          color: Colors.black,),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.remove_red_eye,           color: Colors.black,),
                                      onPressed: (){
                                        setState(() {
                                          _PasswordShow=!_PasswordShow;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(          color: Colors.black,width: 3),
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 18,),


                                SizedBox(height: 18,),
                                Padding(
                                  padding: const EdgeInsets.symmetric( horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ButtonTheme(
                                        minWidth: 110.0,
                                        height: 45.0,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(17.0),
                                              side: BorderSide(          color: Colors.black,)
                                          ),
                                          color: Colors.black,
                                          onPressed: () async{

                                            if(_formKey.currentState.validate()){
                                              setState(() => loading = true);
                                              dynamic result;

                                              result = await auth.signInWithEmailAndPassword(email, password);

                                              if(result==null){
                                                setState(() {
                                                  loading=false;
                                                  error= auth.displayerror();
                                                });
                                              }else{
                                                Navigator.push(context, MaterialPageRoute(builder: ((context)=>Pfy())));
                           //                     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>TakeImage()));
                                                //
                                                //
                                                // Map<String,dynamic> additems ={
                                                //
                                                //   'username': username,'email': email, 'phone': phone,'uid': uid,'user':users,
                                                // };
                                                //
                                                // CollectionReference reference = FirebaseFirestore.instance.collection("users");
                                                // await reference.add(additems);
                                                // if(vendor){
                                                //  }
                                                // else{
                                                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                                // }
                                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>TakeImage()));

                                              }
                                            }


                                          },
                                          child: const Text( "Sign In",
                                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.027),
                                  child: Text(error, style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height*0.02,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
