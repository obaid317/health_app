import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Screens/Exercise.dart';

import 'loading.dart';
class PlanCal extends StatefulWidget {
  String plan;

  PlanCal({this.plan});

  @override
  _PlanCalState createState() => _PlanCalState();
}

class _PlanCalState extends State<PlanCal> {
  @override
  Widget build(BuildContext context) {
    Query reference = FirebaseFirestore.instance.collection(widget.plan).orderBy('day',descending: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Plans"),
      ),
      body: SafeArea(
        child: Column(
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
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Exercise(Exercises: docu['exercise'],)));
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.calendar_today_rounded,size: 25,),
                                          Text("Day "+(docu['day']).toString(),style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                          ),)
                                          ,                   Icon(Icons.arrow_right_alt),

                                        ],),
                                    ),
                                  ),
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
            // ListView.builder(
            //     shrinkWrap: true,itemCount: 9, itemBuilder: (context,index){
            //   return    Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: GestureDetector(
            //       onTap: (){
            //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Exercise(Exercises: "beginners",)));
            //       },
            //       child: Container(
            //         color: Colors.white,
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(horizontal:20.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Icon(Icons.calendar_today_rounded,size: 25,),
            //                 Text("Day "+(index+1).toString(),style: TextStyle(
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.bold,
            //
            //                 ),)
            //                 ,                   Icon(Icons.arrow_right_alt),
            //
            //               ],),
            //           ),
            //         ),
            //       ),
            //     ),
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
