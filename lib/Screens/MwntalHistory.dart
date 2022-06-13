import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Services/Sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'loading.dart';
class StressHistory extends StatefulWidget {
  @override
  _StressHistoryState createState() => _StressHistoryState();
}

class _StressHistoryState extends State<StressHistory> {
  TooltipBehavior _tooltipBehavior;
  String uid,name;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    // TODO: implement initState
    super.initState();
    getuid();
  }
  void getuid()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String   uids  =  await prefs.getString('uid');

    setState(() {
      uid=uids;

    });
}
  @override
  Widget build(BuildContext context) {
    List <SalesData> a=[    SalesData('0', 0),];
    Query ref = FirebaseFirestore.instance.collection("stress").where("uid",isEqualTo: uid).orderBy("datentime");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stress History"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
children: [
  // SfCartesianChart(
  //
  //     primaryXAxis: CategoryAxis(),
  //     // Chart title
  //     title: ChartTitle(text: 'Stress Analysis'),
  //     // Enable legend
  //     legend: Legend(isVisible: true),
  //     // Enable tooltip
  //     tooltipBehavior: _tooltipBehavior,
  //
  //     series: <LineSeries<SalesData, String>>[
  //       LineSeries<SalesData, String>(
  //           dataSource:  a,
  //           xValueMapper: (SalesData sales, _) => sales.year,
  //           yValueMapper: (SalesData sales, _) => sales.sales,
  //           // Enable data label
  //           dataLabelSettings: DataLabelSettings(isVisible: true)
  //       )
  //     ]
  // ),

  Expanded(
    child: StreamBuilder<QuerySnapshot>(


        stream: ref.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData) {
            return
              Container(
                child:  ListView.builder(shrinkWrap: true, itemCount: snapshot.data.size , itemBuilder: (context, index) {
                  var docu = snapshot.data.docs[index].data();
                  String uids=docu['uid'];
                  print("uid"+uids);
              
                  a.add(SalesData(docu['date'].toString().substring(5,10), docu['stress']));

                  return Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: GestureDetector(
                      onTap: (){
                        // showDialog(context: context,builder:(context)=>Dialog(
                        //
                        //     insetPadding: EdgeInsets.zero,
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: Container(
                        //           height: 180,
                        //
                        //           width:MediaQuery.of(context).size.width*0.8,
                        //           child: Column(
                        //               children:[
                        //                 Expanded(child:
                        //
                        //                 Padding(
                        //                   padding: const EdgeInsets.symmetric(vertical:25.0,horizontal: 20),
                        //                   child:   Container(child:
                        //
                        //                   Text("Continue to a video call ",style: TextStyle(
                        //                     fontSize: 17,
                        //                     color:Colors.black,
                        //                   ),),),
                        //                 ),),
                        //
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Row(
                        //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //                     children: [
                        //                       ButtonTheme(
                        //                         minWidth: 80.0,
                        //                         height: 40.0,
                        //                         child: RaisedButton(
                        //                           shape: RoundedRectangleBorder(
                        //                               borderRadius: BorderRadius.circular(7.0),
                        //                               side: BorderSide(   color:Colors.black,)
                        //                           ),
                        //                           color:Colors.black,
                        //                           onPressed: () async{
                        //                             Navigator.pop(context);
                        //                           },
                        //                           child: const Text("Cancel",
                        //                             style: TextStyle(fontSize: 14, color: Colors.white, ),
                        //
                        //                           ),
                        //                         ),
                        //                       ),
                        //                       ButtonTheme(
                        //                         minWidth: 80.0,
                        //                         height: 40.0,
                        //                         child: RaisedButton(
                        //                           shape: RoundedRectangleBorder(
                        //                               borderRadius: BorderRadius.circular(7.0),
                        //                               side: BorderSide( color:Colors.black,)
                        //                           ),
                        //                           color:Colors.black,
                        //                           onPressed: () async{
                        //                             print(docu["uid"]);
                        //
                        //                             Navigator.pop(context);
                        //                           },
                        //                           child: const Text("Continue",
                        //                             style: TextStyle(fontSize: 14, color: Colors.white, ),
                        //
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //
                        //
                        //               ]
                        //           )
                        //       ),
                        //     )
                        // )
                        // );

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
                                  child: Text("Stress Level : "+docu['stress'].toString(),style: TextStyle(
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


}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}