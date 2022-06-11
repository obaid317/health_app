
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Services/AuthService.dart';

import 'loading.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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
              child: loading ? Loading() :SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height:  MediaQuery.of(context).size.height*0.06,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Text(

                        "Sign Up",style: TextStyle(

                        fontSize: MediaQuery.of(context).size.height*0.05,

                        color: Colors.black,

                        fontWeight: FontWeight.bold,

                      ),

                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child:  Container(
                          padding: EdgeInsets.all(12),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  maxLines: 1,
                                  validator: (val) => val.isEmpty ? 'Enter an email id' : null,
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
                                  validator: (val) => val.isEmpty ? 'Enter a username' : null,
                                  onChanged: (val) {
                                    setState(() => username = val);
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),

                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person,           color: Colors.black,),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(          color: Colors.black,width: 3),
                                    ),
                                    labelText: 'Name',

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
                                              result = await auth.registerWithEmailAndPassword(email, password, username, context);
                                              if(result==null){
                                                setState(() {
                                                  loading=false;
                                                  error= auth.displayerror();
                                                });
                                              }else{

                                              }
                                            }


                                          },
                                          child: const Text("Sign UP",
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
