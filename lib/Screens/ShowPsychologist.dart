import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Screens/videoplay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'VideoCall.dart';
import 'loading.dart';
class ShowPsychologist extends StatefulWidget {
  @override
  _ShowPsychologistState createState() => _ShowPsychologistState();
}

class _ShowPsychologistState extends State<ShowPsychologist> {
  String uid;
  @override
  void initState() {
    getuid();
    // TODO: implement initState
    super.initState();
  }
  Future<void> getuid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid =await  prefs.getString('uid');
     
    setState(() {
     // reference=ref;
    });
  }

  @override
  Widget build(BuildContext context) {

    Query reference=FirebaseFirestore.instance.collection("online").where("uid",isEqualTo: uid);
    return Container(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(


              stream: reference.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasData) {
                  print("sdvihldshldskl");
                  return
                    Container(
                      child:  ListView.builder(shrinkWrap: true, itemCount: snapshot.data.size , itemBuilder: (context, index) {
                        var docu = snapshot.data.docs[index].data();
                        return Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: GestureDetector(
                            onTap: (){
                              onJoin(
                                isBroadcaster: true,
                                channelname: docu['channel'],
                              );
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
                                        child: Text("Mam Rabia",style: TextStyle(
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
                                                SizedBox(height: 20,),
                                                Row(
                                                  children: [
                                                    Icon(Icons.circle,color: Colors.green,size: 10,),
                                                    SizedBox(width: 10,),
                                                    Text("Online",style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10,
                                                    ),),
                                                  ],
                                                ),
                                              ],                            ),
                                          ),
                                          Container(
                                            height: 110,
                                            width: 220,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("asset/MentalHealth.png",),
                                                fit: BoxFit.fitHeight,

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
        ],
      ),


    );
  }
  Future<void> onJoin({bool isBroadcaster,String channelname}) async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastPage(
          channelName: channelname,
          isBroadcaster: isBroadcaster,
          isAdmin:false,
          uid: "kayla",
        ),
      ),
    );
  }
}
