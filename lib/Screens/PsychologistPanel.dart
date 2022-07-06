import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'VideoCall.dart';
import 'loading.dart';
class PsychPanel extends StatefulWidget {
  @override
  _PsychPanelState createState() => _PsychPanelState();
}

class _PsychPanelState extends State<PsychPanel> {
  Query reference=FirebaseFirestore.instance.collection("stress");
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Psychologist Panel"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(height: 40,   decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(33),bottomLeft: Radius.circular(33) ),
          ),),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(


                stream: reference.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasData) {
                    return
                      Container(
                        child:  ListView.builder(shrinkWrap: true, itemCount: snapshot.data.size , itemBuilder: (context, index) {
                          var docu = snapshot.data.docs[index].data();
                          String uids=docu['uid'];
                          print("uid"+uids);
                          return Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: GestureDetector(
                              onTap: (){
                                showDialog(context: context,builder:(context)=>Dialog(

                                    insetPadding: EdgeInsets.zero,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 180,

                                          width:MediaQuery.of(context).size.width*0.8,
                                          child: Column(
                                              children:[
                                                Expanded(child:

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(vertical:25.0,horizontal: 20),
                                                  child:   Container(child:

                                                  Text("Continue to a video call ",style: TextStyle(
                                                    fontSize: 17,
                                                    color:Colors.black,
                                                  ),),),
                                                ),),

                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      ButtonTheme(
                                                        minWidth: 80.0,
                                                        height: 40.0,
                                                        child: RaisedButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(7.0),
                                                              side: BorderSide(   color:Colors.black,)
                                                          ),
                                                          color:Colors.black,
                                                          onPressed: () async{
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text("Cancel",
                                                            style: TextStyle(fontSize: 14, color: Colors.white, ),

                                                          ),
                                                        ),
                                                      ),
                                                      ButtonTheme(
                                                        minWidth: 80.0,
                                                        height: 40.0,
                                                        child: RaisedButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(7.0),
                                                              side: BorderSide( color:Colors.black,)
                                                          ),
                                                          color:Colors.black,
                                                          onPressed: () async{
                                                            print(docu["uid"]);
                                                            onJoin(
                                                              isBroadcaster: true,
                                                              channelname: "docuocuocuocu",
                                                              uid: docu["uid"]
                                                            );
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text("Continue",
                                                            style: TextStyle(fontSize: 14, color: Colors.white, ),

                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),


                                              ]
                                          )
                                      ),
                                    )
                                )
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
                                          child: Text(docu['username'],style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("Recommendation : ",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),),
                                              ),
                                              Container(

                                                child: Text(docu['recommendation'].toString(),style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),),
                                              ),

                                              SizedBox(height: 20,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Stress Level : " + docu['stress'].toString(),style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),),
                                                  Text(docu['date'].toString().substring(0,10),style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),),
                                                ],
                                              ),

                                            ],                            ),
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

  Future<void> onJoin({bool isBroadcaster,String channelname,String uid}) async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
print(uid);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastPage(
          channelName: channelname,
          isBroadcaster: isBroadcaster,
          isAdmin: true,
          uid: uid,
        ),
      ),
    );
  }
}
