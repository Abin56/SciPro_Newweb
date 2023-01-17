import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../model/live_course_addModel.dart';
import '../widgets/button_container.dart';

class CreateLiveCourseScreen extends StatefulWidget {
  CreateLiveCourseScreen({Key? key}) : super(key: key);

  @override
  State<CreateLiveCourseScreen> createState() => _CreateLiveCourseScreenState();
}

class _CreateLiveCourseScreenState extends State<CreateLiveCourseScreen> {
  String listID = "";
  creatNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    listID = roomName;
  }

  TextEditingController courseNameController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController courseFeeContoller = TextEditingController();
  TextEditingController durationContoller = TextEditingController();
  TextEditingController courseIDContoller = TextEditingController();
  TextEditingController roomIDContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
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

  @override
  void initState() {
    creatNewMeeting();
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Live Course"),
      ),
        body: SafeArea(
            child: Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 2700,
          width: 800,
          child: ListView(
            children: [
              SizedBox(
                  height: 500,
                  width: 500,
                  child: LottieBuilder.asset(
                      "assets/images/63886-developer-working.json")),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: courseNameController,
                decoration: InputDecoration(
                    hintText: "Course Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: facultyController,
                decoration: InputDecoration(
                    hintText: "Facultie Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: courseFeeContoller,
                decoration: InputDecoration(
                    hintText: "Course Fee",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: durationContoller,
                decoration: InputDecoration(
                    hintText: "Duration in days10",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: courseIDContoller,
                decoration: InputDecoration(
                    hintText: "Course ID ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordContoller,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 60,
                width: 100,
                child: Center(
                  child: Text(
                    "ROOM ID : " + listID,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  final addtofirebase = LiveCourseAddModel(
                      message: 'Class will be Start Soon!!',
                      password: passwordContoller.text.trim(),
                      roomID: listID,
                      courseTitle: courseNameController.text.trim(),
                      facultyName: facultyController.text.trim(),
                      courseFee: courseFeeContoller.text.trim(),
                      id: '',
                      duration: durationContoller.text.trim(),
                      courseID: courseIDContoller.text.trim(),
                      postedDate: dateText,
                      postedTime: timeText);
                  LiveCourseAddToFireBase()
                      .liveCourseController(addtofirebase, context);
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 60,
                  width: 100,
                  child: const Center(
                    child: Text(
                      "Add Course",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    )));
  }
}
