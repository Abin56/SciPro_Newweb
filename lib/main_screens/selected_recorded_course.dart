import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lepton_sci_web/admin/admin_hybrid_courses.dart';
import 'package:lepton_sci_web/main_screens/explore_videos.dart';

import '../admin/admin_rec_courses.dart';


class SelectedRecordedCourse extends StatefulWidget {
  final String courseId;
  const SelectedRecordedCourse({Key? key,required this.courseId}) : super(key: key);

  @override
  _SelectedRecordedCourseState createState() => _SelectedRecordedCourseState();
}

class _SelectedRecordedCourseState extends State<SelectedRecordedCourse> {
  String name =  "";
  //List<Map<String,dynamic>> data = [


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


  //final userId = loginUser!.uid.toString();
  CollectionReference ref = FirebaseFirestore.instance.collection('Admin');


  String listID = "";
  String _courseTitle="";
  String _courseFee ="";
  String _courseDuration="";
  String _courseID="";
  String _facultyName="";
  String _dater="";
  String _timer="";
  String _videoNumber="";

  creatNewMeeting() async {
    var random= Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    listID = roomName;
  }

  String courseid= arCourseID;

  CollectionReference refRecorded = FirebaseFirestore.instance.collection("RecordedCourse");
  CollectionReference refLive = FirebaseFirestore.instance.collection("LiveCourseList");
  CollectionReference refHybrid = FirebaseFirestore.instance.collection("HybridCourseList");

  void getCourseTitle() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourses").doc(
        arec_courseID).get();
    setState(() {
      _courseTitle = vari.data()!['CourseTitle'];
    });
  }
  void getCourseDuration() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourses").doc(
        arec_courseID).get();
    setState(() {
      _courseDuration = vari.data()!['CourseDuration'];
    });
  }
  void getCourseFee() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourses").doc(
        arec_courseID).get();
    setState(() {
      _courseFee = vari.data()!['CourseFee'];
    });
  }
  void getCourseID() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourses").doc(arec_courseID).get();
    setState(() {
      _courseID = vari.data()!['CourseID'];
    });
  }

  void getFacultyName() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourses").doc(arec_courseID).get();
    setState(() {
      _facultyName = vari.data()!['FacultyName'];
    });
  }
  void getDate() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourses").doc(arec_courseID).get();
    setState(() {
      _dater = vari.data()!['Date'];
    });
  }
  void getTime() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourses").doc(arec_courseID).get();
    setState(() {
      _timer = vari.data()!['Time'];
    });
  }
  void getVideoNumber() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("RecordedCourseList").doc(arec_courseID).get();
    setState(() {
      _videoNumber = vari.data()!['VideoNumber'];
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
    creatNewMeeting();
    getCourseDuration();
    getCourseFee();
    getCourseID();
    getCourseTitle();
    getFacultyName();
    getDate();
    getTime();
    getVideoNumber();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    //var a = courseID;

    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
            title: Card(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            )),
        body: Stack(
            children:[
              Container(
                width: screenSize.width*1/2-50,
                margin: EdgeInsets.only(left: 50),
                child:
                ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Container(
                      height: 50,
                      color: Colors.black54,
                      child:  Center(child: Text("Scipro Recorded Course Details",
                        style: TextStyle(fontSize: screenSize.height*1/20 ),)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.black54,
                      child:  Center(child: Text(_courseTitle+"    Course Details",
                        style: TextStyle(fontSize: screenSize.height*1/30 ),)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.blueGrey,
                      child:  Center(child: Text("Course Title:      " + _courseTitle)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.black54,
                      child:  Center(child: Text("Course SubTitle:   " + _courseID)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.blueGrey,
                      child:  Center(child: Text("Faculty:            " + _facultyName)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.black54,
                      child:  Center(child: Text("Course Fee:         " + _courseFee)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.blueGrey,
                      child:  Center(child: Text("Duration:           " + _courseDuration)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.black54,
                      child:  Center(child: Text("Course ID:          " + _courseID)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.blueGrey,
                      child:  Center(child: Text("Posted Date:         " + _dater)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.black54,
                      child:  Center(child: Text("Posted Time:          " + _timer)),
                    ),
                    Container(
                      height: 50,
                      color: Colors.blueGrey,
                      child:  Center(child: Text("Current Video Number   " + _videoNumber)),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenSize.width*1/2-50,
                margin: EdgeInsets.only(left: screenSize.width*1/2+50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExploreVideos(selectedCourseId: _courseID,)
                            ),
                          );
                        },
                        child:
                        Container(
                            width: screenSize.width*1/4,
                            height: screenSize.height*1/8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:  BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0,4),
                                  )
                                ]
                            ),
                            child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Text("Explore Videos",style:
                                  TextStyle(
                                      color: Colors.black,
                                      fontSize: screenSize.width*1/70 ),),
                                  Icon(Icons.tv)
                                ]
                            )
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminRecCourses()
                            ),
                          );
                        },
                        child:
                        Container(
                            width: screenSize.width*1/4,
                            height: screenSize.height*1/8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:  BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0,4),
                                  )
                                ]
                            ),
                            child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Text("Subscribe Course",style:
                                  TextStyle(
                                      color: Colors.black,
                                      fontSize: screenSize.width*1/70 ),),
                                  Icon(Icons.tv)
                                ]
                            )
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminRecCourses()
                            ),
                          );
                        },
                        child:
                        Container(
                            width: screenSize.width*1/4,
                            height: screenSize.height*1/8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:  BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0,4),
                                  )
                                ]
                            ),
                            child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Text("",style:
                                  TextStyle(
                                      color: Colors.black,
                                      fontSize: screenSize.width*1/70 ),),
                                  Icon(Icons.tv)
                                ]
                            )
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ])
    );
  }
}
