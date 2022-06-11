import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Recommendations extends StatefulWidget {
  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
int stressLevel=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadModel();
  }
  LoadModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
 int   slevel= await prefs.getInt("stress");
 setState(() {
   stressLevel=slevel;
 });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Stress Level"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          
                      children: [
                        Container(height: 40,   decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(33),bottomLeft: Radius.circular(33) ),
                        ),),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: CircularPercentIndicator(
                                  radius: 150.0,
                                  animation: true,
                                  animationDuration: 1200,
                                  lineWidth: 15.0,
                                  percent: stressLevel/64,
                                  center: new Text(
                                     "$stressLevel",
                              style:
                              new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.black,
                        ),
                           ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text("Stress Level",style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0
                          ),)),
                        ),
                        if(stressLevel>=0&&stressLevel<9)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("Low",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                        ),
                        if(stressLevel>8&&stressLevel<20)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("Normal",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                        ),
                        if(stressLevel>19&&stressLevel<30)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            decoration: BoxDecoration(
                              color: Colors.yellow[500],
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("A tad high",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.black
                                ),),
                              ),
                            ),
                          ),
                        ),
                        if(stressLevel>29&&stressLevel<40)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("High",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.black
                                ),),
                              ),
                            ),
                          ),
                        ),
                        if(stressLevel>39&&stressLevel<50)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            decoration: BoxDecoration(
                              color: Colors.red[500],
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("Concerning",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0,color:  Colors.black
                                ),),
                              ),
                            ),
                          ),
                        ),
                        if(stressLevel>49)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("Extremely Concerning",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.black
                                ),),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 22),
                          child: Row(
                            children: [
                              Text("Recommendations",  style:    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                            ],
                          ),
                        ),
                        if(stressLevel>=0&&stressLevel<9)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text("Activiy Title",style: TextStyle(
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
                                              Container(
                                                width:MediaQuery.of(context).size.width*0.8,
                                                child: Text("Push-up is an exercise done laying with face, palms and toes facing down, keeping legs and back straight, extending arms straight to push body up and back down again. Push-up is a great exercise that works the chest, shoulder and arm muscles.",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),),
                                              ),


                                            ],                            ),
                                        ),
                                        // Container(
                                        //   height: 110,
                                        //   width: 170,
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/ubh-fitness.appspot.com/o/images%2F2022-02-28%2003%3A13%3A28.928210?alt=media&token=48c5092b-47f3-40ec-8705-a89bd256e860",),
                                        //       fit: BoxFit.cover,
                                        //
                                        //     ),
                                        //     borderRadius: BorderRadius.circular(22),
                                        //   ),
                                        //
                                        // )
                                      ],
                                    ),
                                  ],

                                ),
                              )
                          ),
                        ),
                        if(stressLevel>8&&stressLevel<20)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text("Activiy Title",style: TextStyle(
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
                                              Container(
                                                width:MediaQuery.of(context).size.width*0.8,
                                                child: Text("Push-up is an exercise done laying with face, palms and toes facing down, keeping legs and back straight, extending arms straight to push body up and back down again. Push-up is a great exercise that works the chest, shoulder and arm muscles.",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),),
                                              ),


                                            ],                            ),
                                        ),
                                        // Container(
                                        //   height: 110,
                                        //   width: 170,
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/ubh-fitness.appspot.com/o/images%2F2022-02-28%2003%3A13%3A28.928210?alt=media&token=48c5092b-47f3-40ec-8705-a89bd256e860",),
                                        //       fit: BoxFit.cover,
                                        //
                                        //     ),
                                        //     borderRadius: BorderRadius.circular(22),
                                        //   ),
                                        //
                                        // )
                                      ],
                                    ),
                                  ],

                                ),
                              )
                          ),
                        ),
                        if(stressLevel>19&&stressLevel<30)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text("Activiy Title",style: TextStyle(
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
                                              Container(
                                                width:MediaQuery.of(context).size.width*0.8,
                                                child: Text("Push-up is an exercise done laying with face, palms and toes facing down, keeping legs and back straight, extending arms straight to push body up and back down again. Push-up is a great exercise that works the chest, shoulder and arm muscles.",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),),
                                              ),


                                            ],                            ),
                                        ),
                                        // Container(
                                        //   height: 110,
                                        //   width: 170,
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/ubh-fitness.appspot.com/o/images%2F2022-02-28%2003%3A13%3A28.928210?alt=media&token=48c5092b-47f3-40ec-8705-a89bd256e860",),
                                        //       fit: BoxFit.cover,
                                        //
                                        //     ),
                                        //     borderRadius: BorderRadius.circular(22),
                                        //   ),
                                        //
                                        // )
                                      ],
                                    ),
                                  ],

                                ),
                              )
                          ),
                        ),
                        if(stressLevel>29&&stressLevel<40)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text("Activiy Title",style: TextStyle(
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
                                              Container(
                                                width:MediaQuery.of(context).size.width*0.8,
                                                child: Text("Push-up is an exercise done laying with face, palms and toes facing down, keeping legs and back straight, extending arms straight to push body up and back down again. Push-up is a great exercise that works the chest, shoulder and arm muscles.",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),),
                                              ),


                                            ],                            ),
                                        ),
                                        // Container(
                                        //   height: 110,
                                        //   width: 170,
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/ubh-fitness.appspot.com/o/images%2F2022-02-28%2003%3A13%3A28.928210?alt=media&token=48c5092b-47f3-40ec-8705-a89bd256e860",),
                                        //       fit: BoxFit.cover,
                                        //
                                        //     ),
                                        //     borderRadius: BorderRadius.circular(22),
                                        //   ),
                                        //
                                        // )
                                      ],
                                    ),
                                  ],

                                ),
                              )
                          ),
                        ),
                        if(stressLevel>39&&stressLevel<50)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text("Activiy Title",style: TextStyle(
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
                                              Container(
                                                width:MediaQuery.of(context).size.width*0.8,
                                                child: Text("Push-up is an exercise done laying with face, palms and toes facing down, keeping legs and back straight, extending arms straight to push body up and back down again. Push-up is a great exercise that works the chest, shoulder and arm muscles.",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),),
                                              ),


                                            ],                            ),
                                        ),
                                        // Container(
                                        //   height: 110,
                                        //   width: 170,
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/ubh-fitness.appspot.com/o/images%2F2022-02-28%2003%3A13%3A28.928210?alt=media&token=48c5092b-47f3-40ec-8705-a89bd256e860",),
                                        //       fit: BoxFit.cover,
                                        //
                                        //     ),
                                        //     borderRadius: BorderRadius.circular(22),
                                        //   ),
                                        //
                                        // )
                                      ],
                                    ),
                                  ],

                                ),
                              )
                          ),
                        ),
                        if(stressLevel>49)Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,

                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text("Activiy Title",style: TextStyle(
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
                                              Container(
                                                width:MediaQuery.of(context).size.width*0.8,
                                                child: Text("Push-up is an exercise done laying with face, palms and toes facing down, keeping legs and back straight, extending arms straight to push body up and back down again. Push-up is a great exercise that works the chest, shoulder and arm muscles.",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),),
                                              ),


                                            ],                            ),
                                        ),
                                        // Container(
                                        //   height: 110,
                                        //   width: 170,
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/ubh-fitness.appspot.com/o/images%2F2022-02-28%2003%3A13%3A28.928210?alt=media&token=48c5092b-47f3-40ec-8705-a89bd256e860",),
                                        //       fit: BoxFit.cover,
                                        //
                                        //     ),
                                        //     borderRadius: BorderRadius.circular(22),
                                        //   ),
                                        //
                                        // )
                                      ],
                                    ),
                                  ],

                                ),
                              )
                          ),
                        ),
                      ],
        ),
      ),
    );
  }
}
