//import 'dart:html';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_app/Services/AuthService.dart';

import 'loading.dart';
class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  AuthService _ath = AuthService();
  bool loading= false;
  final _formKey = GlobalKey<FormState>();

  List<UploadTask> uploadedTasks = List();
  List<File> selectedFiles = List();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  List<dynamic> photos=[],videos=[];
  String temp,temp1;
  String reps,rests,sets,desc,tittle,tag,age,height,color,orientation,category,price;
  String error = '';
  String email="";
  final tagfieldText = TextEditingController();
  final heightfieldText = TextEditingController();
  final agefieldText = TextEditingController();
  final colorfieldText = TextEditingController();
  final pricefieldText = TextEditingController();
  final orientationfieldText = TextEditingController();
  final categoryfieldText = TextEditingController();

  uploadFileToStorage(File file) async {

    UploadTask task = _firebaseStorage
        .ref()
        .child("images/${DateTime.now().toString()}")
        .putFile(file);
    final  snapshot = await task.whenComplete(() => {});
    temp = await snapshot.ref.getDownloadURL();
    photos.add(temp);
    setState(() {
      loading=false;
    });
    return task;
  }
  uploadVideoToStorage(File file) async {

    UploadTask task = _firebaseStorage
        .ref()
        .child("videos/${DateTime.now().toString()}")
        .putFile(file);
    final  snapshot = await task.whenComplete(() => {});
    temp1 = await snapshot.ref.getDownloadURL();
    print(temp);
    videos.add(temp);
    setState(() {
      loading=false;
    });
    return task;
  }

  Future selectVideoToUpload() async {
    try {


      FilePickerResult result = await FilePicker.platform
          .pickFiles(allowMultiple: false, type: FileType.video);

      if (result != null) {
        selectedFiles.clear();

        result.files.forEach((selectedFile) {
          File file = File(selectedFile.path);
          selectedFiles.add(file);
        });
        selectedFiles.forEach((file) {
          setState(() {
            loading=true;
          });
          final UploadTask task = uploadVideoToStorage(file);
          // saveVideoUrlToFirebase(task);

          setState(() {
            uploadedTasks.add(task);
          });
        });

      } else {
        print("User has cancelled the selection");
      }
    } catch (e) {
      print(e);
    }
  }

  Future selectImageToUpload() async {
    try {
      FilePickerResult result = await FilePicker.platform
          .pickFiles(allowMultiple: false, type: FileType.image,allowCompression: true);

      if (result != null) {
        selectedFiles.clear();

        result.files.forEach((selectedFile) {
          File file = File(selectedFile.path);
          selectedFiles.add(file);
        });

        selectedFiles.forEach((file) {
          setState(() {
            loading=true;
          });
          final UploadTask task = uploadFileToStorage(file);
          setState(() {
            uploadedTasks.add(task);
          });
        }
        );
      } else {
        print("User has cancelled the selection");
      }
    } catch (e) {
      print(e);
    }
  }
  fieldTextclear(){
    tagfieldText.clear();
    heightfieldText.clear() ;
    agefieldText.clear() ;
    colorfieldText.clear();
    pricefieldText.clear();
    orientationfieldText.clear();
    categoryfieldText.clear();
    setState(() {
      videos.clear();
      photos.clear();
    });
    //   Toast.sz
    //Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

    Fluttertoast.showToast(msg: "Uploaded successfully",
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white,
      backgroundColor: Color.fromARGB(255,177,30,36),
      gravity: ToastGravity.BOTTOM,

    );
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[

              TextFormField(
                controller:  tagfieldText ,
                maxLines: 1,
                validator: (val) => val.isEmpty ? 'Enter Reps' : null,
                onChanged: (val) {
                  setState(() => reps = val);
                },
                style: TextStyle(
                  color:  Color.fromARGB(255,177,30,36),
                ),

                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(  color: Color.fromARGB(255,177,30,36),width: 3),
                  ),
                  labelText: 'Food',

                  labelStyle: TextStyle(
                    color:  Color.fromARGB(255,177,30,36),

                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller:  orientationfieldText,
                maxLines: 1,
                validator: (val) => val.isEmpty ? 'Enter rest' : null,
                onChanged: (val) {
                  setState(() => rests = val);
                },
                style: TextStyle(
                  color: Color.fromARGB(255,177,30,36),
                ),

                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(  color: Color.fromARGB(255,177,30,36),width: 3),
                  ),
                  labelText: 'Serving',

                  labelStyle: TextStyle(
                    color: Color.fromARGB(255,177,30,36),

                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller:  heightfieldText ,
                keyboardType: TextInputType.number,
                maxLines: 1,
                validator: (val) => val.isEmpty ? 'Enter sets' : null,
                onChanged: (val) {
                  setState(() => sets = val);
                },
                style: TextStyle(
                  color:  Color.fromARGB(255,177,30,36),
                ),

                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(  color:  Color.fromARGB(255,177,30,36),width: 3),
                  ),
                  labelText: 'Calories',

                  labelStyle: TextStyle(
                    color:  Color.fromARGB(255,177,30,36),

                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //
              // SizedBox(height: 20,),
              // TextFormField(
              //   controller:  colorfieldText ,
              //   maxLines: 1,
              //   validator: (val) => val.isEmpty ? 'Enter desc' : null,
              //   onChanged: (val) {
              //     setState(() => desc = val);
              //   },
              //   style: TextStyle(
              //     color:Color.fromARGB(255,177,30,36),
              //   ),
              //
              //   decoration: InputDecoration(
              //
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
              //       borderSide: BorderSide(  color:  Color.fromARGB(255,177,30,36),width: 3),
              //     ),
              //     labelText: 'desc',
              //
              //     labelStyle: TextStyle(
              //       color: Color.fromARGB(255,177,30,36),
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20,),
              // TextFormField(
              //   controller:  categoryfieldText ,
              //   maxLines: 1,
              //   validator: (val) => val.isEmpty ? 'Enter tittle' : null,
              //   onChanged: (val) {
              //     setState(() => tittle = val);
              //   },
              //   style: TextStyle(
              //     color:  Color.fromARGB(255,177,30,36),
              //   ),
              //
              //   decoration: InputDecoration(
              //
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
              //       borderSide: BorderSide(  color:  Color.fromARGB(255,177,30,36),width: 3),
              //     ),
              //     labelText: 'tittle',
              //
              //     labelStyle: TextStyle(
              //       color:  Color.fromARGB(255,177,30,36),
              //
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),

              SizedBox(height: 20,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       loading ? Loading():  ButtonTheme(
              //         minWidth: 150,
              //         child: RaisedButton(
              //
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(17.0),
              //               side: BorderSide(  color:  Color.fromARGB(255,177,30,36),)
              //           ),
              //           color:  Color.fromARGB(255,177,30,36),
              //
              //           onPressed: () async {
              //             // FilePickerResult result =await FilePicker.platform.pickFiles(allowMultiple: true );
              //             selectImageToUpload();
              //           },
              //           child: photos==null ? Text("Upload Images",
              //             style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              //
              //           ): Text("Uploaded photos ${photos.length}",style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
              //         ),
              //       ),
              //       loading ? Loading():  ButtonTheme(
              //         minWidth: 150,
              //         child: RaisedButton(
              //
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(17.0),
              //               side: BorderSide(  color:  Color.fromARGB(255,177,30,36),)
              //           ),
              //           color:  Color.fromARGB(255,177,30,36),
              //
              //           onPressed: () async {
              //             // FilePickerResult result =await FilePicker.platform.pickFiles(allowMultiple: true );
              //             selectVideoToUpload();
              //           },
              //           child: videos==null ? Text("Upload Videos",
              //             style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              //
              //           ):
              //           Text("Uploaded Video ${videos.length}",style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              ButtonTheme(
                minWidth: 150,
                child: RaisedButton(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      side: BorderSide(  color:  Color.fromARGB(
                          255, 177, 30, 36),)
                  ),
                  color:  Color.fromARGB(255,177,30,36),

                  onPressed: ()async {

                    if(_formKey.currentState.validate()){

                      Map<String,dynamic> additems ={

                        'food': reps,'serv': rests, 'cal': sets,
                      };
                      CollectionReference reference = FirebaseFirestore.instance.collection("calories");
                      await reference.add(additems);
                      fieldTextclear();
                      // if(photos.isEmpty&&videos.isEmpty){
                      //   Fluttertoast.showToast(msg: "Upload videos and photos");
                      // }else{
                      //
                      //
                      // }


                    }

                  },

                  child: const Text("Submit",
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),

                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

}
