import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth_service.dart';
import '../widgets/journy_page_button.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

final userId = loginUser!.uid.toString();

class _StudentHomeState extends State<StudentHome> {
  AuthService service = AuthService();

  final Uri toLaunch =
  Uri(scheme: 'https', host: 'test.scipro.in', path: '');
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  String timeText = "";
  String dateText = "";
  String roomName = "";

  String title = "loading";


  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LiveCourses").doc(
        user!.uid ).get();
    setState(() {
      title= vari.data()!['Title'];
    });
  }

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime(){
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

  getRoomID() {
    var random= Random();
    roomName = (random.nextInt(10000000) + 10000000).toString();
  }


  @override
  void initState() {

    super.initState();

    //date
    dateText = formatCurrentDate(DateTime.now());

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer)
    {
      getCurrentLiveTime();
    }
    );
    getData();
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video_call');
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
    appBar:  AppBar(
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
              Image.asset("assets/images/Icon-192.png"),
              SizedBox(width: screenSize.width*0.3),

                  Container(
                    child: Text("Login ",style:
                    TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),

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
          child:
              Container(
                color: Color(0xda524444),
                child:
          Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenSize.width*1/3.5,
                      color: Color(0xda524444),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            color: Color(0xfc670707),
                            height: screenSize.height*1/10,
                            child: Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(screenSize.width*1/100),
                                  child: Text("Recorded Class",
                                    style: TextStyle(
                                      fontSize: screenSize.width*1/70,
                                      color: Colors.white
                                  ),),
                                ),
                                Expanded(child: Container()),

                                Container(
                                    width: screenSize.width*1/20,
                                    child:
                                    Image.asset("assets/images/iconrec.png",
                                    )),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              width: screenSize.width*1/3.5,
                              height: screenSize.height*1/1.75,
                              color: Color(0xFF36363A),
                              child: Text(""),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: screenSize.width*1/3,
                          alignment: Alignment.bottomCenter,
                          child: Image.asset("assets/images/liveclass.png",height: screenSize.height,
                            width: screenSize.width,),
                        ),
                    Container(
                      width: screenSize.width*1/3.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Color(0xfc670707),
                            height: screenSize.height*1/10,
                            child: Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(screenSize.width*1/100),
                                  child: Text("Live Classes",
                                    style: TextStyle(
                                      fontSize: screenSize.width*1/70,
                                      color: Colors.white

                                  ),),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(timeText,style:
                                    TextStyle(color:
                                    Colors.white,
                                        fontSize: screenSize.width*1/100),),
                                    Text(dateText,style:
                                    TextStyle(color:
                                    Colors.white,
                                        fontSize: screenSize.width*1/100),)
                                  ],),
                                Expanded(child: Container()),

                                Container(
                                    width: screenSize.width*1/20,
                                    child:
                                    Image.asset("assets/images/iconlive.png",
                                    )),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  color: Color(0xFF36363A),
                                  width: screenSize.width*1/3.5,
                                  height: screenSize.height*1/1.75,
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Join Class",
                                            style: TextStyle(
                                              color: Colors.white,
                                            fontSize: 20,) ,),
                                          SizedBox(height: screenSize.height*1/20,),
                                          InkWell(
                                            onTap: (){},
                                            child:
                                          JournyPageButton(
                                            onPressed: () {
                                              _launched = _launchInBrowser(toLaunch);
                                            },
                                            text: '',
                                            icon: Icons.video_camera_back_outlined,),)
                                        ],
                                      )

                                    ],)
                                  ,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
        ],
      ),
        ),
        ),
    );
  }
}
