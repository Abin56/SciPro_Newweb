import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'auth_service.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class AdminUpdatePage extends StatefulWidget {
  String? faculty,password,recrodedTitle,recordedSubTitle,
      recordedDuration,recordedFees,facultyNameController,videoNumberController;
  AdminUpdatePage({Key? key}) : super(key: key);

  @override
  State<AdminUpdatePage> createState() => _AdminUpdatePageState();
}

class _AdminUpdatePageState extends State<AdminUpdatePage> {
  String timeText = "";
  String dateText = "";

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if (this.mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }


  final userId = loginUser!.uid.toString();
  CollectionReference ref = FirebaseFirestore.instance.collection('Admin');
  CollectionReference refRecordedClass = FirebaseFirestore.instance.collection('RecordedClasses');
  CollectionReference refLiveClasses = FirebaseFirestore.instance.collection('LiveClasses');
  CollectionReference refHybridClasses = FirebaseFirestore.instance.collection('HybridCourses');

  TextEditingController facultyController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController recrodedTitleController = TextEditingController();
  TextEditingController recordedSubTitleController = TextEditingController();
  TextEditingController recordedDurationController = TextEditingController();
  TextEditingController recordedFeesController = TextEditingController();
  TextEditingController facultyNameController = TextEditingController();
  TextEditingController videoNumberController = TextEditingController();
  TextEditingController courseIdController= TextEditingController();


  String imageUrl="";
  String img="";
  double progress = 0.0;


  void getImg() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("Admin").doc(
        "RecordedClasses").get();
    setState(() {
      img = vari.data()!['recordedClassUrl'+videoNumberController.text];

      //imageUrl1=vari.toString();
    });
  }

  void upLoadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List? file = result.files.first.bytes;
      String fileName = result.files.first.name;
      //filename = fileName;


      UploadTask task = FirebaseStorage.instance.ref()
          .child("$userId/$fileName")
          .putData(file!);
      TaskSnapshot snapshot = await task;
      imageUrl = await snapshot.ref.getDownloadURL();
      FirebaseFirestore.instance.collection('Admin').
      doc('RecordedClasses')
          .update(({
        "recordedClassUrl"+ videoNumberController.text  : imageUrl
      }));

      task.snapshotEvents.listen((event) {
        setState(() {
          progress = ((event.bytesTransferred
              .toDouble()/event
              .totalBytes.toDouble())*100)
              .roundToDouble();
          print(progress);
        });
      });
    }

  }
  void upLoadFaculty() {
    refRecordedClass.doc(courseIdController.text).update({
      'CourseTitle': recrodedTitleController.text,
      'CourseSubTitle': recordedSubTitleController.text,
      'CourseDuration': recordedDurationController.text,
      'CourseFee': recordedFeesController.text,
      'FacultyName': facultyNameController.text,

    });
  }

  @override
  void initState() {
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    }
    );
    getImg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace:
          Container
            (
            height: 70,
            width: screenSize.width,
            color: Color (0xFF0eb8ff),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(width: 100,),
                Image.asset("assets/images/SCIPRO.png"),
                SizedBox(width: screenSize.width*0.3),

                Container(child:
                Text("Login ",style:
                TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),

                Expanded(child: Container()),
                InkWell(
                    onTap: (){
                      AuthService().StudentsignOut(context);
                    },
                    child:
                    Container(
                      child:
                      Image.asset("assets/images/sout.png",height: 50,width:50),))
              ],
            ),

          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
              SizedBox(height:screenSize.height*1/15),
              Text("Welcome Admin",style: TextStyle(
                  color: Colors.black,
                  fontSize: screenSize.width*1/45,
                  fontWeight: FontWeight.bold
              ),),
            ],),
            Row(children: [
              Container(
                width: screenSize.width*1/3,
                height: screenSize.height*2,
                color: const Color (0xFF1493d2),
                child: Column(
                  children: [

                    Text("Upload Recorded Class",style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),),
                    Container(
                      color: Colors.blueAccent,
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),

                            Container(
                              child: const Text("Select Recorded Class ",style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                      InkWell(
                        onTap: () {

                        },
                        child:
                          Container(
                              child:
                              Column(
                                children: [
                                  TextButton(onPressed: () async {

                                    FilePickerResult? result = await FilePicker.platform.pickFiles();

                                    if (result != null) {
                                      Uint8List? file1 = result.files.first.bytes;
                                      String fileName1 = result.files.first.name;
                                      //filename = fileName;

                                      UploadTask task1 = FirebaseStorage.instance.ref()
                                          .child("$userId/$fileName1")
                                          .putData(file1!);
                                      TaskSnapshot snapshot = await task1;
                                      imageUrl = await snapshot.ref.getDownloadURL();

                                      // FirebaseFirestore.instance.collection('Admin').
                                      //doc('RecordedClasses')
                                      //  .update(({
                                      // "recordedClassUrl"+ dateText + timeText  : imageUrl
                                      //}));

                                      task1.snapshotEvents.listen((event) {
                                        setState(() {
                                          progress = ((event.bytesTransferred
                                              .toDouble()/event
                                              .totalBytes.toDouble())*100)
                                              .roundToDouble();
                                          print(progress);
                                        });
                                      });
                                    }

                                  }, child: const Text("Select File")),
                                  const SizedBox(height: 20,),
                                  SizedBox(
                                      height: screenSize.height*1/4,
                                      width: screenSize.width*1/8,
                                      child: LiquidCircularProgressIndicator(
                                          borderColor: Colors.red,
                                          borderWidth: 2,
                                          value: progress/100,
                                          valueColor:  AlwaysStoppedAnimation(Colors.greenAccent),
                                          backgroundColor:Colors.white,
                                          direction: Axis.vertical,
                                          center: Text("$progress%",style:  TextStyle(fontSize: screenSize.width*1/90))
                                      )
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              )
                          ),
                      ),
                        Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              controller: courseIdController,
                              decoration: InputDecoration(
                                  hintText: "EnterCourseID",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              controller: videoNumberController,
                              decoration: InputDecoration(
                                  hintText: "Enter Video Number",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              controller: recrodedTitleController,
                              decoration: InputDecoration(
                                  hintText: "Enter Title",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              obscureText: true,
                              controller: facultyNameController,
                              decoration: InputDecoration(
                                  hintText: "Enter Faculty Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              //obscureText: true,
                              controller: recordedSubTitleController,
                              decoration: InputDecoration(
                                  hintText: "Enter Subtitle",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              //obscureText: true,
                              controller: recordedDurationController,
                              decoration: InputDecoration(
                                  hintText: "Enter Duration",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              //obscureText: true,
                              controller: recordedFeesController,
                              decoration: InputDecoration(
                                  hintText: "Enter Fees",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(height: 10,),
                          MaterialButton(
                            onPressed: () {
                              //uploadFile();
                              refRecordedClass.doc().update({
                                'CourseTitle'+videoNumberController.text: recrodedTitleController.text,
                                'CourseSubTitle'+videoNumberController.text: recordedSubTitleController.text,
                                'CourseDuration'+videoNumberController.text: recordedDurationController.text,
                                'CourseFee'+videoNumberController.text: recordedFeesController.text,
                                'FacultyName'+videoNumberController.text: facultyNameController.text,
                                'ImageUrl'+videoNumberController.text: imageUrl,
                                "Date": dateText,
                                "Time": timeText

                              }).whenComplete(() {
                                //Navigator.pushReplacement(
                                //   context, MaterialPageRoute(
                                //   builder: (_) => const Login()));
                              });
                            },
                            child: const Text(
                                "save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red)
                            ),
                          ),

                        ],
                      ),

                    )
                  ],
                ),

              ),

              Container(
                width: screenSize.width*1/3,
                height: screenSize.height*2,
                color: const Color (0xFF1493d2),
                child: Column(
                  children: [

                    Text("Upload Live Course",style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),),
                    Container(
                      color: Colors.blueAccent,
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              controller: videoNumberController,
                              decoration: InputDecoration(
                                  hintText: "Enter CourseID",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              controller: videoNumberController,
                              decoration: InputDecoration(
                                  hintText: "Enter Video Number",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              controller: recrodedTitleController,
                              decoration: InputDecoration(
                                  hintText: "Enter Title",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              obscureText: true,
                              controller: facultyNameController,
                              decoration: InputDecoration(
                                  hintText: "Enter Faculty Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              //obscureText: true,
                              controller: recordedSubTitleController,
                              decoration: InputDecoration(
                                  hintText: "Enter Subtitle",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              //obscureText: true,
                              controller: recordedDurationController,
                              decoration: InputDecoration(
                                  hintText: "Enter Duration",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              //obscureText: true,
                              controller: recordedFeesController,
                              decoration: InputDecoration(
                                  hintText: "Enter Fees",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(height: 10,),
                          MaterialButton(
                            onPressed: () {
                              //uploadFile();
                              ref.doc("RecordedClasses").update({
                                'CourseTitle'+videoNumberController.text: recrodedTitleController.text,
                                'CourseSubTitle'+videoNumberController.text: recordedSubTitleController.text,
                                'CourseDuration'+videoNumberController.text: recordedDurationController.text,
                                'CourseFee'+videoNumberController.text: recordedFeesController.text,
                                'FacultyName'+videoNumberController.text: facultyNameController.text,
                                'ImageUrl'+videoNumberController.text: imageUrl,
                                "Date": dateText,
                                "Time": timeText

                              }).whenComplete(() {
                                //Navigator.pushReplacement(
                                //   context, MaterialPageRoute(
                                //   builder: (_) => const Login()));
                              });
                            },
                            child: const Text(
                                "save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red)
                            ),
                          ),

                        ],
                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              const Text("Faculty Control Panel",style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              Container(
                color: Colors.blueAccent,
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text("Add Faculty ",style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: facultyController,
                        decoration: InputDecoration(
                            hintText: "Enter FacultyID",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(height: 10,),
                    MaterialButton(
                      onPressed: () {
                        //uploadFile();
                        ref.doc("facultyCredential").set({

                          'FacultyID': facultyController.text,
                          'Password': passwordController.text,

                        }).whenComplete(() {
                          //Navigator.pushReplacement(
                          //   context, MaterialPageRoute(
                          //   builder: (_) => const Login()));
                        });
                      },
                      child: const Text(
                          "save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red)
                      ),
                    ),

                  ],
                ),
              )
            ],),
            Row(children:[
              Column(
                children: [

                ],
              )
            ],)
          ],
        ),
      ),

    );
  }
}
