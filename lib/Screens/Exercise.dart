import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Screens/videoplay.dart';
import 'package:video_player/video_player.dart';

import 'loading.dart';
class Exercise extends StatefulWidget {
  String Exercises;

  Exercise({this.Exercises});

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {

  //Query reference = FirebaseFirestore.instance.collection(widget.Exercises);

  @override
  Widget build(BuildContext context) {
    Query reference = FirebaseFirestore.instance.collection(widget.Exercises);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.black,
      centerTitle: true,
        title: Text("Exercises"),


      ),
      body: Column(

          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(


        stream: reference.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.hasData) {
                      return
                        Container(
                          child:  ListView.builder(shrinkWrap: true, itemCount: snapshot.data.size , itemBuilder: (context, index) {
                            var docu = snapshot.data.docs[index].data();
                            return Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: GestureDetector(
                                onTap: (){
                                 /// Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoApp(titt: docu["tittle"],desc: docu['description'],reps: docu['Reps'],rests: docu['Rests'],sets: docu['Sets'],vurl: docu['videos'],)));
                                },
                                child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,

                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text("docu['name']",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Psychologist",style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                    ),),

                                                  ],                            ),
                                              ),
                                              Container(
                                                height: 110,
                                                width: 220,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("asset/MentalHealth.png",),
                                                    fit: BoxFit.cover,

                                                  ),
                                                  borderRadius: BorderRadius.circular(22),
                                                ),

                                              )
                                            ],
                                          ),
                                        ],

                                      ),
                                    )
                                ),
                              ),
                            );
                          },
                          ),
                        );



                    }

                    else{
                      return Loading();
                    }

                  }),
            ),

          ],
        ),
    );
  }
}
