import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Screens/loading.dart';
class Calchart extends StatefulWidget {
  @override
  _CalchartState createState() => _CalchartState();
}

class _CalchartState extends State<Calchart> {
  Query reference = FirebaseFirestore.instance.collection("calories");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
          centerTitle: true,
        title: Text("Calorie Chart"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
Container(
  height: 50,
 decoration: BoxDecoration(
color: Colors.black,
borderRadius: BorderRadius.only(bottomRight: Radius.circular(33),bottomLeft: Radius.circular(33)),
 ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal:8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(

          child: Text("Food",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          ),
        ),
        Container(
          child: Text("Serving Size",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          ),
        ),
        Container(
           child: Text("Calories",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          ),
        ),
      ],
    ),
  ),
),
Expanded(
  child:   Container(
  
    child: Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: reference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasData){

                return  ListView.builder(shrinkWrap: true,itemCount: snapshot.data.size,itemBuilder: (context,index){
                  var docu = snapshot.data.docs[index].data();

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                         color: Colors.white,
                        borderRadius: BorderRadius.circular(21)
                      ),
                      child: Column(
                        children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(docu["food"],),
        ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(docu["serv"],),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(docu["cal"],),
    ),
  ],
)
                          // Row(
                          //
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //
                          //   children: [
                          //
                          //     Text(
                          //
                          //       docu["food"],style: TextStyle(
                          //
                          //       fontSize: 15,
                          //
                          //       fontWeight: FontWeight.w600,
                          //
                          //     ),
                          //
                          //     ),
                          //
                          //     Text(
                          //
                          //       docu["serv"]  ,style: TextStyle(
                          //
                          //       fontSize: 15,
                          //
                          //       fontWeight: FontWeight.w600,
                          //
                          //     ),
                          //
                          //     ),Text(
                          //
                          //       docu["cal"],
                          //
                          //       style: TextStyle(
                          //
                          //         fontSize: 15,
                          //
                          //         fontWeight: FontWeight.w600,
                          //
                          //       ),
                          //
                          //     )
                          //
                          //   ],
                          //
                          // ),
                        ],
                      ),
                    ),
                  );
                },);
              }
              else{
                return Loading();
              }
            },
          ),
        ),


      ],
    ),
  
  ),
)
          ],
        ),
      ),
    );
  }
}
