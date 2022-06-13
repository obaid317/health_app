import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Screens/PhysicalFitness.dart';
import 'package:health_app/Services/Sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_kit/survey_kit.dart';

class MentalSurvey extends StatefulWidget {
  @override
  _MentalSurveyState createState() => _MentalSurveyState();
}

class _MentalSurveyState extends State<MentalSurvey> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: FutureBuilder<Task>(
            future: getSampleTask(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                final task = snapshot.data;
                return SurveyKit(
                  onResult: (SurveyResult result) {
                    int score = 0;
                    for (var stepResult in result.results) {
                      print(""+stepResult.results[0].valueIdentifier);
                    }
                    print("final Score is $score");  // int score = 0;

                  },
                  task: task,


                  themeData:  Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.cyan,
                    ).copyWith(
                      onPrimary: Colors.white,
                    ),
                    primaryColor: Colors.black,
                    backgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                      color: Colors.white,
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.black,
                    ),
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor:Colors.black,
                      selectionColor:Colors.black,
                      selectionHandleColor: Colors.black,
                    ),
                    cupertinoOverrideTheme: CupertinoThemeData(
                      primaryColor: Colors.black,
                    ),
                    outlinedButtonTheme: OutlinedButtonThemeData(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(150.0, 60.0),
                        ),
                        side: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return BorderSide(
                                color: Colors.grey,
                              );
                            }
                            return BorderSide(
                              color: Colors.black,
                            );
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        textStyle: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                color: Colors.grey,
                              );
                            }
                            return Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(
                              color: Colors.black,
                            );
                          },
                        ),
                      ),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    textTheme: TextTheme(
                      headline2: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                      headline5: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      bodyText2: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                      subtitle1: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),

                );
              }
              return CircularProgressIndicator.adaptive();
            },
          ),
        ),
      ),
    );
  }

  Future<Task> getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the\nQuickBird Studios\nHealth Survey',
          text: 'Get ready for a bunch of super random questions!',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          title: 'Q1',
          text: 'Little interest or pleasure in doing things?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling down, depressed, or hopeless?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling more irritated, grouchy, or angry than usual? ',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Sleeping less than usual, but still have a lot of energy?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Starting lots more projects than usual or doing more risky things than usual?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling nervous, anxious, frightened, worried, or on edge?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling panic or being frightened?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Avoiding situations that make you anxious?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Unexplained aches and pains (e.g., head, back, joints, abdomen, legs)?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: ' Feeling that your illnesses are not being taken seriously enough?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Thoughts of actually hurting yourself?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Hearing things other people couldn’t hear, such as voices even when no one was around?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling that someone could hear your thoughts, or that you could hear what another person was thinking?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Problems with sleep that affected your sleep quality over all?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Problems with memory (e.g., learning new information) or with location (e.g., finding your way home)?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Unpleasant thoughts, urges, or images that repeatedly enter your mind?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),

        CompletionStep(

          id: StepIdentifier(id: '321'),
          text: 'Thanks for taking the survey, we will contact you soon!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[6].id,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Yes":
              return task.steps[0].id;
            case "No":
              return task.steps[7].id;
            default:
              return null;
          }
        },
      ),
    );
    return Future.value(task);
  }

}






















class MyAppss extends StatefulWidget {
  @override
  _MyAppssState createState() => _MyAppssState();
}

class _MyAppssState extends State<MyAppss> {
  String uid,name;
  @override
  void initState() {
    getuid(); // TODO: implement initState
    super.initState();
    getuid();
  }

  Future<void> getuid() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
  String   uids  =  await prefs.getString('uid');
  String names= await SharedPreferenceHelper().getUserEmail() as String;
  setState(() {
    uid=uids;
    name=names;

  });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String recommendation=" ";
    CollectionReference ref = FirebaseFirestore.instance.collection("stress");
    return  Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: FutureBuilder<Task>(
            future: getSampleTask(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                final task = snapshot.data;
                return SurveyKit(

                  onResult: (SurveyResult result) async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();

                    int score = 0,value=0;
                    for (var stepResult in result.results) {
                  //  print("khkhkh"+stepResult.results[0].valueIdentifier);
                    if(stepResult.results[0].valueIdentifier=="Not at all"){
                      score=score+0;
                    }
                    if(stepResult.results[0].valueIdentifier=="Rare, less than a day or two"){
                      score=score+1;
                    }
                    if(stepResult.results[0].valueIdentifier=="Several days"){
                      score=score+2;
                    }
                    if(stepResult.results[0].valueIdentifier=="More than half the days"){
                      score=score+3;
                    }
                    if(stepResult.results[0].valueIdentifier==" Nearly every day"){
                      score=score+4;
                    }
                    value++;
                    }
                  prefs.setInt("stress", score);
                    int stressLevel=0;
                    setState(() {
                      stressLevel=score;
                    });
                    print("final Score is $score");
                    if(stressLevel>=0&&stressLevel<9) {
                      recommendation="Breathing Exercise";
                    }
                    if(stressLevel>8&&stressLevel<20)  {
                      recommendation="Relaxation Techniques";
                    }
                    if(stressLevel>19&&stressLevel<30)  {
                      recommendation="Mindfulness meditation";
                    }
                    if(stressLevel>29&&stressLevel<40)  {
                      recommendation="Practice self-care";
                    }
                    if(stressLevel>39&&stressLevel<50)  {
                      recommendation="Consider supplements";
                    }
                    if(stressLevel>49)  {
                      recommendation="Psychologist Consultation";
                    }
                    Map<String,dynamic> addItem={
                      "uid":uid,
                      "stress": score,
                      "recommendation":recommendation,
                      "username":name,
                      "date":DateTime.now().toString(),
                      "datentime":DateTime.now(),
                      // int score = 0;
                    };
               await     ref.add(addItem);

                  },
                  task: task,

                  themeData:  Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.cyan,
                    ).copyWith(
                      onPrimary: Colors.white,
                    ),
                    primaryColor: Colors.black,
                    backgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                      color: Colors.white,
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.black,
                    ),
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor:Colors.black,
                      selectionColor:Colors.black,
                      selectionHandleColor: Colors.black,
                    ),
                    cupertinoOverrideTheme: CupertinoThemeData(
                      primaryColor: Colors.black,
                    ),
                    outlinedButtonTheme: OutlinedButtonThemeData(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(150.0, 60.0),
                        ),
                        side: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return BorderSide(
                                color: Colors.grey,
                              );
                            }
                            return BorderSide(
                              color: Colors.black,
                            );
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        textStyle: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                color: Colors.grey,
                              );
                            }
                            return Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(
                              color: Colors.black,
                            );
                          },
                        ),
                      ),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    textTheme: TextTheme(
                      headline2: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                      headline5: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      bodyText2: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                      subtitle1: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),


                );
              }
              return CircularProgressIndicator.adaptive();
            },
          ),
        ),
      ),
    );
  }

  Future<Task> getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the\nUBH\nHealth Survey',
          text: 'Complete the following survey to determine your stress level',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          text: 'Little interest or pleasure in doing things?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ], 
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling down, depressed, or hopeless?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
       QuestionStep(
          title: '',
          text: 'Feeling more irritated, grouchy, or angry than usual? ',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Sleeping less than usual, but still have a lot of energy?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Starting lots more projects than usual or doing more risky things than usual?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling nervous, anxious, frightened, worried, or on edge?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling panic or being frightened?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Avoiding situations that make you anxious?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Unexplained aches and pains (e.g., head, back, joints, abdomen, legs)?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: ' Feeling that your illnesses are not being taken seriously enough?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Thoughts of actually hurting yourself?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Hearing things other people couldn’t hear, such as voices even when no one was around?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Feeling that someone could hear your thoughts, or that you could hear what another person was thinking?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Problems with sleep that affected your sleep quality over all?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Problems with memory (e.g., learning new information) or with location (e.g., finding your way home)?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),
        QuestionStep(
          title: '',
          text: 'Unpleasant thoughts, urges, or images that repeatedly enter your mind?',
          isOptional: false,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Not at all', value: '0'),
              TextChoice(text: 'Rare, less than a day or two', value: '1'),
              TextChoice(text: 'Several days', value: '2'),
              TextChoice(text: 'More than half the days', value: '3'),
              TextChoice(text: ' Nearly every day', value: '4'),
              // Nearly every day
            ],
          ),
        ),

        CompletionStep(

          id: StepIdentifier(id: '321'),
          text: 'Thanks for taking the survey, we will contact you soon!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[6].id,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Yes":
              return task.steps[0].id;
            case "No":
              return task.steps[7].id;
            default:
              return null;
          }
        },
      ),
    );
    return Future.value(task);
  }


}