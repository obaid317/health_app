import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/Screens/Account.dart';
import 'package:health_app/Screens/CalorieChart.dart';
import 'package:health_app/Screens/Exercise.dart';
import 'package:health_app/Screens/PLansCalendar.dart';
import 'package:health_app/Screens/Recommendation.dart';
import 'package:health_app/Screens/home_page.dart';
import 'package:health_app/data/questions.dart';
import 'package:health_app/model/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pfy extends StatefulWidget {
  @override
  _PfyState createState() => _PfyState();
}

class _PfyState extends State<Pfy> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
        LoadModel();

  }
  bool recomendation=false;
 double bmr=0.0001,bmi=00.0001;
 Category a= Category(
   questions: questions,
   categoryName: 'Physics',
   imageUrl: 'assets/physics.png',
   backgroundColor: Colors.blue,
   icon: FontAwesomeIcons.rocket,
   description: 'Practice questions from various chapters in physics',
 );
String bmistr="";
 int selectedindex =0;
 LoadModel() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
 double  bmrs = await double.parse(prefs.getString("bmr"));
   double  bmis = await double.parse(prefs.getString("bmi"));
   setState(() {
   bmr=bmrs;
   bmi=bmis;
    print(bmr);
  });
if(bmi<15){
  setState(() {
    bmistr="Severlt Under Weight";
  });
}
   if(bmi>15&&bmi<18.5){
     setState(() {
       bmistr="Under Weight";
     });
   }
   if(bmi>18.5&&bmi<25){
     setState(() {
       bmistr="Normal";
     });
   }
   if(bmi>25&&bmi<35){
     setState(() {
       bmistr="Obese";
     });
   }
   if(bmi>35.5){
     setState(() {
       bmistr="Overly obese";
     });
   }

 }

  @override
  Widget build(BuildContext context) {


    onITEMTAP(int index){
      setState(() {
        selectedindex=index;
      });
    }

    //using list to Display Widgets for navigation bar
    final List<Widget> widgets = [
      SingleChildScrollView(
        child: DefaultTabController(

          initialIndex: 0,
          length: 3,
          child: Container(

            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(

                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(33),bottomLeft: Radius.circular(33) ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBar(
                            indicatorColor: Colors.white,
                            labelColor:   Colors.white,
                            labelStyle: TextStyle(

                              fontWeight: FontWeight.bold,
                            ) ,
                            unselectedLabelColor: Colors.grey,
                            tabs:[
                              Tab(text: "Diet"),
                              Tab(text: "Exercise"),
                              Tab(text: "Plans",),
                            ]),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.8),
                  child: TabBarView(children: [
                    Container(
                      child: Column(

                        children: [

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(bmr.toString().substring(0,4),style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 39,
                                  ),),
                                  Text("Avg Calorie Consumption",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),),
                                  SizedBox(height: 20,),
                                  Text(bmi.toString().substring(0,2),style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 39,
                                  ),),
                                  Text("BMI indicates you are "+bmistr,style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:60.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text((bmr*1.1).toString().substring(0,4),style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                    ),),
                                    Text("Weight Gain",style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text((bmr).toString().substring(0,4),style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                    ),),
                                    Text("Weight Maintain",style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),)
                                  ],
                                )

                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:60.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text((bmr*0.92).toString().substring(0,4),style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                    ),),
                                    Text("Mild Weight loss",style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text((bmr*0.85).toString().substring(0,4),style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                    ),),
                                    Text("Weight loss",style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),)
                                  ],
                                )

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:48.0),
                            child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width*0.63,
                              height: 45.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),

                                ),
                                color: Colors.black,


                                onPressed: () async {
Navigator.push(context, MaterialPageRoute(builder: (context)=>Calchart()));
                                },
                                child: const Text(" "
                                    'Calorie Chart' '',
                                  style: TextStyle(fontSize: 15, color: Colors.white),

                                ),
                              ),
                            ),
                          ),
                        ],

                      ),

                    ),

                    Container(
                      child: Column(

                        children: [
                          Form(

                              child:Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                child: Column(
                                  children: [
                                    _introCard(),
                                    _introCardd(),
                                    _introCarddd(),
                                  ],
                                ),
                              )
                          )
                        ],

                      ),
                    ),


                                      Container(
                      child: Column(
                        children: [
                          GridView.builder( shrinkWrap: true,
                            primary: true,
                            itemCount: 4,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context,int index){
                              if(index==0) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanCal(plan: 'begin plan',)));
                                  },
                                  child: Container(
                                    height: 270,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 235,
                                          alignment: Alignment.topRight,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(11),
                                              topLeft: Radius.circular(11),),

                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Mann_mit_ausgepr%C3%A4gten_Muskeln_am_Arm.jpg/640px-Mann_mit_ausgepr%C3%A4gten_Muskeln_am_Arm.jpg",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              // SizedBox(
                                              //   height: 5,
                                              // ),
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                                  child: Text(
                                                    " Beginners " + "",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 0,
                                              // ),
                                              // Text(
                                              //   "City : "+     "widget.productcity",
                                              //   overflow: TextOverflow.ellipsis,
                                              //   style: TextStyle(
                                              //     color: Colors.white,
                                              //     fontSize: 12,
                                              //   ),
                                              // ),
                                              // SizedBox(
                                              //   height: 0,
                                              // ),
                                              // Row(
                                              //   children: [
                                              //     Text("Price : "+
                                              //         " {widget. toString()}",
                                              //       overflow: TextOverflow.ellipsis,
                                              //       style: TextStyle(
                                              //         color: Colors.white,
                                              //         fontSize: 12,
                                              //       ),
                                              //     ),
                                              //
                                              //
                                              //   ],
                                              // )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }else
                              if(index==1) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanCal(plan: 'bulk plan')));
                                  },
                                  child: Container(
                                    height: 270,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 235,
                                          alignment: Alignment.topRight,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(11),
                                              topLeft: Radius.circular(11),),

                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                "https://i.pinimg.com/originals/94/92/08/9492088ea12c5ceb0ce53c2960f4833d.jpg",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              // SizedBox(
                                              //   height: 5,
                                              // ),
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                                  child: Text(
                                                    " Bulk " + "",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 0,
                                              // ),
                                              // Text(
                                              //   "City : "+     "widget.productcity",
                                              //   overflow: TextOverflow.ellipsis,
                                              //   style: TextStyle(
                                              //     color: Colors.white,
                                              //     fontSize: 12,
                                              //   ),
                                              // ),
                                              // SizedBox(
                                              //   height: 0,
                                              // ),
                                              // Row(
                                              //   children: [
                                              //     Text("Price : "+
                                              //         " {widget. toString()}",
                                              //       overflow: TextOverflow.ellipsis,
                                              //       style: TextStyle(
                                              //         color: Colors.white,
                                              //         fontSize: 12,
                                              //       ),
                                              //     ),
                                              //
                                              //
                                              //   ],
                                              // )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }
                              if(index==2) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanCal(plan: 'Cardio plan')));
                                  },
                                  child: Container(
                                    height: 270,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 235,
                                          alignment: Alignment.topRight,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(11),
                                              topLeft: Radius.circular(11),),

                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                "https://www.bodybuilding.com/images/2021/june/dial-in-your-cardio-to-lose-fat-faster-tall.jpg",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              // SizedBox(
                                              //   height: 5,
                                              // ),
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                                  child: Text(
                                                    " Cardio " + "",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 0,
                                              // ),
                                              // Text(
                                              //   "City : "+     "widget.productcity",
                                              //   overflow: TextOverflow.ellipsis,
                                              //   style: TextStyle(
                                              //     color: Colors.white,
                                              //     fontSize: 12,
                                              //   ),
                                              // ),
                                              // SizedBox(
                                              //   height: 0,
                                              // ),
                                              // Row(
                                              //   children: [
                                              //     Text("Price : "+
                                              //         " {widget. toString()}",
                                              //       overflow: TextOverflow.ellipsis,
                                              //       style: TextStyle(
                                              //         color: Colors.white,
                                              //         fontSize: 12,
                                              //       ),
                                              //     ),
                                              //
                                              //
                                              //   ],
                                              // )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }

                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanCal(plan: 'Shred plan')));
                                },
                                child: Container(
                                  height: 270,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 235,
                                        alignment: Alignment.topRight,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(11),
                                            topLeft: Radius.circular(11),),

                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkEnrpT0rxBR97RrewySPT89YGvVIZMXYjSt5sUA691pdtwP7Iy0rspiMhoc8Mloat3ho&usqp=CAU",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            // SizedBox(
                                            //   height: 5,
                                            // ),
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: Text(
                                                  " Shred " + "",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 0,
                                            // ),
                                            // Text(
                                            //   "City : "+     "widget.productcity",
                                            //   overflow: TextOverflow.ellipsis,
                                            //   style: TextStyle(
                                            //     color: Colors.white,
                                            //     fontSize: 12,
                                            //   ),
                                            // ),
                                            // SizedBox(
                                            //   height: 0,
                                            // ),
                                            // Row(
                                            //   children: [
                                            //     Text("Price : "+
                                            //         " {widget. toString()}",
                                            //       overflow: TextOverflow.ellipsis,
                                            //       style: TextStyle(
                                            //         color: Colors.white,
                                            //         fontSize: 12,
                                            //       ),
                                            //     ),
                                            //
                                            //
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );

                            },
                          ),


                        ],
                      ),
                    ),

                  ]),
                ),

              ],
            ) ,
          ),
        ),
      ),
   Container(
     child: Column(
       children: [

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image(image: AssetImage("asset/MentalHealth.png"),height: 300,),
           ],
         ),
         Text("Mental Health Module",style: TextStyle(
           fontSize: 21,
fontWeight: FontWeight.bold,
         ),),
         SizedBox(height: MediaQuery.of(context).size.height*0.1,),
         recomendation?Padding(
           padding:   EdgeInsets.fromLTRB(0, 10, 0, 10),
           child: ButtonTheme(
             minWidth: MediaQuery.of(context).size.width*0.63,
             height: 45.0,
             child: RaisedButton(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(28.0),

               ),
               color:  Colors.black,

               onPressed: () async {
                 setState(() {
                   recomendation=true;
                 });
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Recommendations()));
               },
               child: const Text(" "
                   'Mental Health Recommendation' '',
                 style: TextStyle(fontSize: 15, color: Colors.white),

               ),
             ),
           ),
         ):
         Padding(
           padding:   EdgeInsets.fromLTRB(0, 10, 0, 10),
           child: ButtonTheme(
             minWidth: MediaQuery.of(context).size.width*0.63,
             height: 45.0,
             child: RaisedButton(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(28.0),

               ),
               color:  Colors.black,

               onPressed: () async {
                 setState(() {
                   recomendation=true;
                 });
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppss()));
               },
               child: const Text(" "
                   'Mental Health Survey' '',
                 style: TextStyle(fontSize: 15, color: Colors.white),

               ),
             ),
           ),
         ),
         Padding(
           padding:   EdgeInsets.fromLTRB(0, 10, 0, 10),
           child: ButtonTheme(
             minWidth: MediaQuery.of(context).size.width*0.63,
             height: 45.0,
             child: RaisedButton(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(28.0),

               ),
               color:  Colors.black,

               onPressed: () async {

               },
               child: const Text(" "
                   'Mental Health History' '',
                 style: TextStyle(fontSize: 15, color: Colors.white),

               ),
             ),
           ),
         ),
       ],
     ),
   ),
      // CategoryPage(category: a),
      Account(),
    ];

    return  Scaffold(
      appBar: AppBar(
        title: Text("UBH Fitness"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:widgets.elementAt(selectedindex),
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: selectedindex,
        selectedItemColor:  Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onITEMTAP,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_outlined, ),
              label: 'Physical'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.panorama_wide_angle),
            label: 'Mental',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),

        ],


      ),
    );
  }
 _introCard()
 {
   return GestureDetector(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Exercise(Exercises: "beginners",)));
     },
     child: Container(
       width: MediaQuery.of(context).size.height*0.49,
       margin: EdgeInsets.only(bottom: 30),
       padding: EdgeInsets.all(16),
       height: 160,
       decoration: BoxDecoration(

         borderRadius: BorderRadius.circular(12),
         color: Colors.black,
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Text(
             'Beginners' ,
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.w600,
               fontSize: 20,
             ),
           ),
           SizedBox(height: 12),

           Spacer(flex: 1),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Text(
                 'Continue',
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.w700,
                   fontSize: 19,
                 ),
               ),
               SizedBox(width: 8),
               Icon(FontAwesomeIcons.arrowRight,
                   size: 26, color: Colors.white),
             ],
           )
         ],
       ),
     ),
   );
 }
 _introCardd()
 {
   return GestureDetector(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Exercise(Exercises: "intermediate",)));
     },
     child: Container(
       width: MediaQuery.of(context).size.height*0.49,
       margin: EdgeInsets.only(bottom: 30),
       padding: EdgeInsets.all(16),
       height: 160,
       decoration: BoxDecoration(

         borderRadius: BorderRadius.circular(12),
         color: Colors.black,),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Text(
             'Intermediate' ,
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.w600,
               fontSize: 20,
             ),
           ),
           SizedBox(height: 12),

           Spacer(flex: 1),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Text(
                 'Continue',
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.w700,
                   fontSize: 19,
                 ),
               ),
               SizedBox(width: 8),
               Icon(FontAwesomeIcons.arrowRight,
                   size: 26, color: Colors.white),
             ],
           )
         ],
       ),
     ),
   );
 }
 _introCarddd()
 {
   return GestureDetector(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Exercise(Exercises: "pro",)));
     },
     child: Container(
       width: MediaQuery.of(context).size.height*0.49,
       margin: EdgeInsets.only(bottom: 30),
       padding: EdgeInsets.all(16),
       height: 160,
       decoration: BoxDecoration(
         color: Colors.black,
         borderRadius: BorderRadius.circular(12),
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Text(
             'Pro' ,
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.w600,
               fontSize: 20,
             ),
           ),
           SizedBox(height: 12),

           Spacer(flex: 1),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Text(
                 'Continue',
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.w700,
                   fontSize: 19,
                 ),
               ),
               SizedBox(width: 8),
               Icon(FontAwesomeIcons.arrowRight,
                   size: 26, color: Colors.white),
             ],
           )
         ],
       ),
     ),
   );
 }

}
