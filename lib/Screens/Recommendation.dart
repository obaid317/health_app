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
                        // Container(height: 40,   decoration: BoxDecoration(
                        //   color: Colors.black,
                        //   borderRadius: BorderRadius.only(bottomRight: Radius.circular(33),bottomLeft: Radius.circular(33) ),
                        // ),),
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
                                child: Text("Mild",style: TextStyle(
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
                                      child: Text("Breathing Exercise",style: TextStyle(
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
                                              Row(
                                                children: [
                                                  Container(
                                                    width:MediaQuery.of(context).size.width*0.8,
                                                    child: Text("1. Sit comfortably on the floor or in a chair.\n2. Breathe in through your nose. Fill your belly all the way up with air.\n3. When you can't breathe in any more, open your mouth as wide as you can. Breathe out with a ""HA"" sound.\n4. Repeat several times",style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 13,
                                                    ),),
                                                  ),

                                                ],
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
                                      child: Text("Relaxation Techniques",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width:MediaQuery.of(context).size.width*0.8,
                                            child: Text(" 1. Offer Namaz\n 2. Yoga\n 3. Tai Chi\n 4. Music and art therapy. \n 5. Any activity that is fun for you",style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),),
                                          ),
                                        ),

                                      ],
                                    ),       Text("Note : At least practise any relaxation technique for 20 minutes ",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),)
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
                                      child: Text("Mindfulness meditation",style: TextStyle(
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
                                                child: Text(" 1. Sit comfortably.\n 2. Focusing on your breathing.\n 3. Bringing your mind's attention to the present moment without concerns about the past or the future.",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
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
                                      child: Text("Practice self-care",style: TextStyle(
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
                                                child: Text("Sett aside time for health care and practise any of the following exercise :  \n 1. Going for a walk outside \n 2. Taking a bath \n 3. Lighting candles \n 4. Reading a good book \n  5. Exercising  \n 6. Stretching before bed",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
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
                                      child: Text("Consider supplements",style: TextStyle(
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
                                                child: Text("Several vitamins and minerals play an important role in your body’s stress response and mood regulation. As such, a deficiency in one or more nutrients may affect your mental health and ability to cope with stress. \nConsider using supplements that contains \n 1. Magnesium \n 2. Rhodiola  \n 3. B vitamins \n 4. L-theanine \n 5. Ashwagandha",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),),
                                              ),
//

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
                                    Text("Note : However, dietary supplements may not be appropriate or safe for everyone. Consult a healthcare professional if you’re interested in using supplements to help relieve stress.",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),)
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
                                      child: Text("Psychologist Consultation",style: TextStyle(
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
                                                child: Text("After analyzing your stress level we have concluded that you have a severe stress level and you are in a dire need of urgent mental help. Your Information have been forwarded to our Psychologist expert and they will contact you soon through video call.",style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
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
                                    Text("Note : Our Psychologist will likely consult you within 24 hour's preferably between 1:00 pm to 5:00pm.",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),)
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
