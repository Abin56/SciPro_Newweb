import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class LiveOne extends StatefulWidget {
  String? title_lc,topic_lc,duration_lc,fees_lc,description_lc;
  LiveOne ({Key? key, this.title_lc,this.topic_lc,this.duration_lc,this.description_lc,
    }) : super(key: key);

  @override
  State<LiveOne> createState() => _LiveOneState();
}

class _LiveOneState extends State<LiveOne> {

  final userId = loginUser!.uid.toString();
  CollectionReference ref = FirebaseFirestore.instance.collection('LiveCourses');
  CollectionReference _lastRef = FirebaseFirestore.instance.collection('LastSession');




  String timeText = "";
  String dateText = "";
  String roomName = "";

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
    getData();
    getLiveDate();
    getLiveSession();
    getLiveTitle();
    getLiveTopic();
    getDuration();
    getRoomId();
    Timer.periodic(const Duration(seconds: 1), (timer)
    {
      getCurrentLiveTime();
    }
    );
  }

  TextEditingController title_lc = TextEditingController();
  TextEditingController description_lc = TextEditingController();
  TextEditingController duration_lc = TextEditingController();
  TextEditingController fees_lc = TextEditingController();
  TextEditingController topic_lc = TextEditingController();



  String title = "loading";
  String description = "loading";
  String duration = "loading";
  String fees ="loading";
  String topic ="loading";
  String date ="loading";
  String episode = "loading";
  String roomid = "loading";
  String _lastDuration = "loading";
  String _lastTopic ="loading";
  String _lastTime ="loading";
  String _day = "loading";
  String _lastTitle = "loading";
  String _lastDescription = "loading";



  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LiveCourses").doc(
        user!.uid ).get();
    setState(() {
      title= vari.data()!['Title'];
    });
  }

  void getLiveTitle() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LastSession").doc(
        user!.uid ).get();
    setState(() {
      _lastTitle= vari.data()!['Title'];
    });
  }

  void getLiveTopic() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LastSession").doc(
        user!.uid ).get();
    setState(() {
      _lastTopic= vari.data()!['Topic'];
    });
  }
  void getLiveDate() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LastSession").doc(
        user!.uid ).get();
    setState(() {
      _lastTime= vari.data()!['Date'];
    });
  }

  void getLiveSession() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LastSession").doc(
        user!.uid ).get();
    setState(() {
      _day= vari.data()!['day'];
    });
  }

  void getDuration() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LiveCourses").doc(
        user!.uid ).get();
    setState(() {
      duration = vari.data()!['Duration'];
    });
  }

  void getRoomId() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LiveCourses").doc(
        user!.uid ).get();
    setState(() {
      roomid = vari.data()!['RoomID'];
    });
  }




  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child:
        Container(
          width: screenSize.width*1/3,
          height: screenSize.height*2,
          child:
          Column(
            children: [
              Container(
                width: screenSize.width*1/3,
                height: screenSize.height*0.7,
                color: Colors.blue,
                child:Column(
                  children:
                  [
                    const SizedBox(height: 10,),
                    Container(
                      width: screenSize.width*0.3,
                      alignment: Alignment.center,
                      child:
                      const Text("Last Live Course",style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      ),),
                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:   Text("Title:" + _lastTitle,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:   Text("Title:" + _lastTopic,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:   Text( "Duration: " + duration,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:   const Text("On",style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),

                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:   Text(_lastTime,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:   Text("Session:" + _day,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:   Text(roomid,style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(20),
                child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[

                  const Center( child:Text("Add Live Course",style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),),
                  const SizedBox(height: 5,),
                   TextField(
                    controller: title_lc,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: topic_lc,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Topic',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: description_lc,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Description',
                    ),
                  ),
                  const SizedBox(height: 5,),
                   TextField(
                    controller: duration_lc,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Duration',
                    ),
                  ),
                  const SizedBox(height: 5,),
                   TextField(
                    controller: fees_lc,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Fees',
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                      child:
                      CustomButton(text:'Create RoomID', onPressed: (){
                        getRoomID();
                      })
                  ),
                  const SizedBox(height: 10,),
                  Container(
                      padding: const EdgeInsets.symmetric( vertical: 5),
                      child:
                      CustomButton(text:'Upload', onPressed: ()
                      {
                        //uploadFile();
                        ref.doc(userId).set({
                          'Title': title_lc.text,
                          'Topic': topic_lc.text,
                          'Duration': duration_lc.text,
                          'Fees': fees_lc.text,
                          'Descrption': description_lc.text,
                          'RoomID': roomName
                        }).whenComplete(() {

                        });
                      },

                      )
                  ),

                ],
              )
              )
            ],),
        )
    );
  }
}




