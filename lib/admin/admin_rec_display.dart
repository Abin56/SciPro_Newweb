import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../admin_update_page.dart';
import '../model_classes/course_model.dart';
import '';
import 'admin_rec_courses.dart';
import 'admin_recorded_courses.dart';

class AdminRecDisplay extends StatefulWidget {
  final String courseId;
  const AdminRecDisplay({Key? key,required this.courseId}) : super(key: key);

  @override
  _AdminRecDisplayState createState() => _AdminRecDisplayState();
}

class _AdminRecDisplayState extends State<AdminRecDisplay> {
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
  TextEditingController recordedCourseIdController= TextEditingController();
  TextEditingController liveTitleController = TextEditingController();
  TextEditingController liveSubTitleController = TextEditingController();
  TextEditingController liveDurationController = TextEditingController();
  TextEditingController liveFeesController = TextEditingController();
  TextEditingController liveFacultyNameController = TextEditingController();
  TextEditingController liveVideoNumberController = TextEditingController();
  TextEditingController liveCourseIdController= TextEditingController();
  TextEditingController hybridTitleController = TextEditingController();
  TextEditingController hybridSubTitleController = TextEditingController();
  TextEditingController hybridDurationController = TextEditingController();
  TextEditingController hybridFeesController = TextEditingController();
  TextEditingController hybridFacultyNameController = TextEditingController();
  TextEditingController hybridVideoNumberController = TextEditingController();
  TextEditingController hybridCourseIdController= TextEditingController();


  String imageUrl="";
  String img="";
  double progress = 0.0;
  String listID = "";
  String _courseTitle="";
  String _courseFee ="";
  String _courseDuration="";
  String _courseID="";
  String _facultyName="";

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
                width: screenSize.width*1/3 ,
                margin: EdgeInsets.only(top: 10,),
                //padding: EdgeInsets.symmetric(horizontal: screenSize.width*1/4),
                child:
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('RecordedCourses').snapshots(),
                  builder: (context, snapshots) {
                    return (snapshots.connectionState == ConnectionState.waiting)
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                          if (arec_courseID.isNotEmpty) {
                            return ListTile(
                              title: Text(
                                data['CourseTitle'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['CourseFee'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              //leading: CircleAvatar(
                              //backgroundImage: NetworkImage(data['profilePhoto']),
                              // ),
                              trailing:Text(
                                data['CourseDuration'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              tileColor: Colors.black45,
                              textColor: Colors.white,
                              hoverColor: Colors.red,
                              selectedColor: Colors.cyan,
                              onTap: () {
                                print(arec_courseID);
                                //Navigator.push(
                                 // context,
                                 // MaterialPageRoute(
                                  //    builder: (context) => RecDisplayAdmin(courseId: arec_courseID)
                                 // ),
                                //);

                              },
                            );
                          }
                          if (data['CourseTitle']
                              .toString()
                              .toLowerCase()
                              .startsWith(name.toLowerCase())) {
                            return ListTile(
                              title: Text(
                                data['CourseTitle'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['CourseFee'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing:Text(
                                data['CourseDuration'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              tileColor: Colors.black45,
                              textColor: Colors.white,
                              hoverColor: Colors.red,
                              selectedColor: Colors.cyan,
                              onTap: () {
                              },
                            );
                          }
                          return Container();
                        });
                  },
                ),
              ),
              Container(
                width: screenSize.width*1/3,
                margin: EdgeInsets.only(left: screenSize.width*1/3),
                child:
                    ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.amber[600],
                          child:  Center(child: Text(_courseTitle+"Course Details")),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[600],
                          child:  Center(child: Text(_courseTitle)),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[500],
                          child:  Center(child: Text(_courseDuration)),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[100],
                          child:  Center(child: Text(_facultyName)),
                        ),
                      ],
                    ),
              ),
              Container(
                margin: EdgeInsets.only(left: screenSize.width*2/3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                                  Text("Upload Recorded Class",style:
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
                                  Text("Edit Recorded Classe",style:
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
                                  Text("Edit Recorded Class",style:
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
