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
import '../show_image.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class UploadRecordedClass extends StatefulWidget {
  String? facultyController,
      passwordController,
      recordedTitleController,
      recordedSubTitleController,
      recordedDurationController,
      recordedFeesController,
      recordedFacultyNameController,
      recordedVideoNumberController,
      recordedCourseIdController,
      liveTitleController,
      liveSubTitleController,
      liveDurationController,
      liveFeesController,
      liveFacultyNameController,
      liveVideoNumberController,
      liveCourseIdController,
      hybridTitleController,
      hybridSubTitleController,
      hybridDurationController,
      hybridFeesController,
      hybridFacultyNameController,
      hybridVideoNumberController,
      hybridCourseIdController;
  UploadRecordedClass(
      {Key? key,
      this.facultyController,
      this.passwordController,
      this.recordedTitleController,
      this.recordedSubTitleController,
      this.recordedDurationController,
      this.recordedFeesController,
      this.recordedFacultyNameController,
      this.recordedVideoNumberController,
      this.recordedCourseIdController,
      this.liveTitleController,
      this.liveSubTitleController,
      this.liveDurationController,
      this.liveFeesController,
      this.liveFacultyNameController,
      this.liveVideoNumberController,
      this.liveCourseIdController,
      this.hybridTitleController,
      this.hybridSubTitleController,
      this.hybridDurationController,
      this.hybridFeesController,
      this.hybridFacultyNameController,
      this.hybridVideoNumberController,
      this.hybridCourseIdController})
      : super(key: key);

  @override
  State<UploadRecordedClass> createState() => _UploadRecordedClassState();
}

class _UploadRecordedClassState extends State<UploadRecordedClass> {
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

  TextEditingController facultyController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController recordedTitleController = TextEditingController();
  TextEditingController recordedSubTitleController = TextEditingController();
  TextEditingController recordedDurationController = TextEditingController();
  TextEditingController recordedFeesController = TextEditingController();
  TextEditingController recordedFacultyNameController = TextEditingController();
  TextEditingController recordedVideoNumberController = TextEditingController();
  TextEditingController recordedCourseIdController = TextEditingController();
  TextEditingController liveTitleController = TextEditingController();
  TextEditingController liveSubTitleController = TextEditingController();
  TextEditingController liveDurationController = TextEditingController();
  TextEditingController liveFeesController = TextEditingController();
  TextEditingController liveFacultyNameController = TextEditingController();
  TextEditingController liveVideoNumberController = TextEditingController();
  TextEditingController liveCourseIdController = TextEditingController();
  TextEditingController hybridTitleController = TextEditingController();
  TextEditingController hybridSubTitleController = TextEditingController();
  TextEditingController hybridDurationController = TextEditingController();
  TextEditingController hybridFeesController = TextEditingController();
  TextEditingController hybridFacultyNameController = TextEditingController();
  TextEditingController hybridVideoNumberController = TextEditingController();
  TextEditingController hybridCourseIdController = TextEditingController();

  String imageUrl = "";
  String img = "";
  double progress = 0.0;

  String listID = "";

  creatNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    listID = roomName;
  }

  CollectionReference refRecorded =
      FirebaseFirestore.instance.collection("RecordedCourseList");
  CollectionReference refLive =
      FirebaseFirestore.instance.collection("LiveCourseList");
  CollectionReference refHybrid =
      FirebaseFirestore.instance.collection("HybridCourseList");

  @override
  void initState() {
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
    creatNewMeeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              height: 70,
              width: screenSize.width,
              color: Color(0xFF0eb8ff),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Image.asset("assets/images/SCIPRO.png"),
                  SizedBox(width: screenSize.width * 0.3),
                  Container(
                      child: Text(
                    "Login ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                  Expanded(child: Container()),
                  InkWell(
                      onTap: () {
                        AuthService().StudentsignOut(context);
                      },
                      child: Container(
                        child: Image.asset("assets/images/sout.png",
                            height: 50, width: 50),
                      ))
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Welcome Admin",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenSize.width * 1 / 3,
                    height: screenSize.height * 2,
                    color: const Color(0xFF1493d2),
                    child: Column(
                      children: [
                        Text(
                          "Upload Recorded Class",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          color: Colors.blueAccent,
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform
                                                .pickFiles();

                                        if (result != null) {
                                          Uint8List? file =
                                              result.files.first.bytes;
                                          String fileName =
                                              result.files.first.name;
                                          filename = fileName;

                                          UploadTask task = FirebaseStorage
                                              .instance
                                              .ref()
                                              .child("$userId/$fileName")
                                              .putData(file!);
                                          TaskSnapshot snapshot = await task;
                                          imageUrl = await snapshot.ref
                                              .getDownloadURL();

                                          // FirebaseFirestore.instance.collection('Admin').
                                          //doc('RecordedClasses')
                                          //  .update(({
                                          // "recordedClassUrl"+ dateText + timeText  : imageUrl
                                          //}));\

                                          task.snapshotEvents.listen((event) {
                                            setState(() {
                                              progress = ((event
                                                              .bytesTransferred
                                                              .toDouble() /
                                                          event.totalBytes
                                                              .toDouble()) *
                                                      100)
                                                  .roundToDouble();
                                              print(progress);
                                            });
                                          });
                                        }
                                      },
                                      child: const Text(
                                        "Select Files",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                      height: screenSize.height * 1 / 4,
                                      width: screenSize.width * 1 / 8,
                                      child: LiquidCircularProgressIndicator(
                                          borderColor: Colors.red,
                                          borderWidth: 2,
                                          value: progress / 100,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.pinkAccent),
                                          backgroundColor: Colors.white,
                                          direction: Axis.vertical,
                                          center: Text("$progress%",
                                              style: TextStyle(
                                                  fontSize: screenSize.width *
                                                      1 /
                                                      90)))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: TextField(
                                  controller: recordedCourseIdController,
                                  decoration: InputDecoration(
                                      hintText: "EnterCourseID",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: TextField(
                                  controller: recordedVideoNumberController,
                                  decoration: InputDecoration(
                                      hintText: "Enter Video Number",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
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
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  //uploadFile();
                                  refRecorded
                                      .doc(recordedVideoNumberController.text)
                                      .set({
                                    'CourseSubTitle':
                                        recordedSubTitleController.text,
                                    'ImageUrl': imageUrl,
                                    'CourseID': recordedCourseIdController.text,
                                    'VideoNumber':
                                        recordedVideoNumberController.text,
                                    "Date": dateText,
                                    "Time": timeText
                                  }).whenComplete(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text("save",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.red)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
