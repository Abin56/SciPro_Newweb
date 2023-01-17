import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../auth_service.dart';
import '../open_file.dart';
import '../screens_new/current_courses_mainpage.dart';
import '../show_image.dart';
import 'Admin MainPage.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class Admin extends StatefulWidget {
  String? recordedCourseName,recordedCourseDuration,recordedCourseFee,
  liveCourseName,liveCourseDuration,liveCourseFee,comboCourseName,
  comboCourseDuration,comboCourseFee;
  Admin ({Key? key,
  }) : super(key: key);


  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {



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
  //var random = Random();
  String listID = "";

  creatNewMeeting() async {
    var random= Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
   // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    listID = roomName;
  }




  final userId = loginUser!.uid.toString();
  CollectionReference refRecorded = FirebaseFirestore.instance.collection("RecordedCourseList");
  CollectionReference refLive = FirebaseFirestore.instance.collection("LiveCourseList");
  CollectionReference refCombo = FirebaseFirestore.instance.collection("ComboCourseList");


  TextEditingController recordedCourseNameController = TextEditingController();
  TextEditingController recordedCourseDurationController = TextEditingController();
  TextEditingController recordedCourseFeeController = TextEditingController();
  TextEditingController liveCourseFeeController = TextEditingController();
  TextEditingController liveCourseNameController = TextEditingController();
  TextEditingController liveCourseDurationController= TextEditingController();
  TextEditingController comboCourseNameController = TextEditingController();
  TextEditingController comboCourseDurationController = TextEditingController();
  TextEditingController comboCourseFeeController = TextEditingController();
  TextEditingController recordedCourseIdController = TextEditingController();
  TextEditingController liveCourseIdController = TextEditingController();
  TextEditingController comboCourseIdController = TextEditingController();



  String imageUrl="";
  String img="";
  double progress = 0.0;



  void getImg() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourseList").doc(
        "RecordedClasses").get();
    setState(() {
      img = vari.data()!['recordedClassUrl'];

      //imageUrl1=vari.toString();
    });
  }

  void upLoadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List? file = result.files.first.bytes;
      String fileName = result.files.first.name;
      filename = fileName;


      UploadTask task = FirebaseStorage.instance.ref()
          .child("$userId/$fileName")
          .putData(file!);
      TaskSnapshot snapshot = await task;
      imageUrl = await snapshot.ref.getDownloadURL();
      FirebaseFirestore.instance.collection('Admin').
      doc('RecordedClasses')
          .update(({
        "recordedClassUrl" : imageUrl
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
    creatNewMeeting();
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

        body:   SingleChildScrollView(
          child:Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.black38,
            child: Row(
              children: [
                Container(
                  width: screenSize.width*1/3,
                  height: screenSize.height,
                  padding: EdgeInsets.all(30),
                  child:
                  Column(
                    children: [
                      Text("Upload Recorded Course",
                          style: TextStyle(
                              fontSize: 20,
                          color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: recordedCourseNameController,
                          decoration: InputDecoration(
                              hintText: "Enter Course Name",hintStyle: TextStyle(color: Colors.blueGrey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: recordedCourseIdController,
                          decoration: InputDecoration(
                              hintText: "Enter CourseId",hintStyle: TextStyle(color: Colors.blueGrey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: recordedCourseDurationController,
                          decoration: InputDecoration(
                              hintText: "Enter Course Duration",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: recordedCourseFeeController,
                          decoration: InputDecoration(
                              hintText: "Enter Fee",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          //uploadFile();
                          refRecorded.doc(listID).set({
                            'CourseTitle': recordedCourseNameController.text,
                            'CourseSubTitle': recordedCourseDurationController.text,
                            'CourseDuration': recordedCourseFeeController.text,
                            'CourseID':recordedCourseIdController.text,
                            'Date': dateText,
                            'time': timeText
                          }).whenComplete(() {
                            Navigator.pushReplacement(
                              context, MaterialPageRoute(
                              builder: (_) =>  CurrentCoursesMainPage()));
                          });
                        },
                        child: const Text(
                            "save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red)
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenSize.width*1/3,
                  height: screenSize.height,
                  padding: EdgeInsets.all(30),
                  child:
                  Column(
                    children: [
                      Text("Upload Live Course",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: liveCourseNameController,
                          decoration: InputDecoration(
                              hintText: "Enter Course Name",hintStyle: TextStyle(color: Colors.blueGrey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: liveCourseIdController,
                          decoration: InputDecoration(
                              hintText: "Enter Course Name",hintStyle: TextStyle(color: Colors.blueGrey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: liveCourseDurationController,
                          decoration: InputDecoration(
                              hintText: "Enter Course Duration",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: liveCourseFeeController,
                          decoration: InputDecoration(
                              hintText: "Enter Fee",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          //uploadFile();
                          refLive.doc(listID).set({
                            'CourseTitle': liveCourseNameController.text,
                            'CourseSubTitle': liveCourseDurationController.text,
                            'CourseDuration': liveCourseFeeController.text,
                            'CourseID': liveCourseIdController,
                            'Date': dateText,
                            'time': timeText
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
                Container(
                  width: screenSize.width*1/3,
                  height: screenSize.height,
                  padding: EdgeInsets.all(30),
                  child:
                  Column(
                    children: [
                      Text("Hybrid Courses",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: comboCourseNameController,
                          decoration: InputDecoration(
                              hintText: "Enter Course Name",hintStyle: TextStyle(color: Colors.blueGrey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: comboCourseIdController,
                          decoration: InputDecoration(
                              hintText: "Enter CourseID",hintStyle: TextStyle(color: Colors.blueGrey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: comboCourseDurationController,
                          decoration: InputDecoration(
                              hintText: "Enter Course Duration",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          //obscureText: true,
                          controller: comboCourseFeeController,
                          decoration: InputDecoration(
                              hintText: "Enter Fee",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          //uploadFile();
                          refCombo.doc(listID).set({
                            'CourseTitle': comboCourseNameController.text,
                            'CourseSubTitle': comboCourseDurationController.text,
                            'CourseDuration': comboCourseFeeController.text,
                            'CourseId':comboCourseIdController,
                            'Date': dateText,
                            'time': timeText
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
          )

        )

    );
  }
}
