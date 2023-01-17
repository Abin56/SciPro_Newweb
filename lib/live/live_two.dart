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
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class LiveTwo extends StatefulWidget {
  String? title_lc,topic_lc,duration_lc,fees_lc,description_lc;
  LiveTwo ({Key? key, this.title_lc,this.topic_lc,this.duration_lc,this.description_lc,
  }) : super(key: key);


  @override
  State<LiveTwo> createState() => _LiveTwoState();
}

class _LiveTwoState extends State<LiveTwo> {

  final userId = loginUser!.uid.toString();
  CollectionReference ref = FirebaseFirestore.instance.collection('LiveCourses');
  CollectionReference refUpdate = FirebaseFirestore.instance.collection('LastSession');

  String videoUrl="";
  double progress = 0.0;



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
    getDuration();

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
  TextEditingController dayController = TextEditingController();


  String title = "loading";
  String description = "loading";
  String duration = "loading";
  String fees ="loading";
  String topic ="loading";
  String date ="loading";
  String episode = "loading";
  String roomid = "loading";


  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LiveCourses").doc(
        user!.uid ).get();
    setState(() {
      title= vari.data()!['Title'];

    });
  }

  void getDuration() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("LiveCourses").doc(
        user!.uid ).get();
    setState(() {
      topic = vari.data()!['Topic'];
    });
  }

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
                      const Text("Current Live Session",style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      ),),
                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:    Text("TITLE: " + title,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:    Text("TOPIC: " + topic,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),

                    Container(
                      margin:  const EdgeInsets.only(top: 20, left: 30),
                      child:   Text(dateText + "   " + timeText,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30,right: 30,top: 10),
                      child:  TextField(
                        controller: dayController,

                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Colors.black,
                          hoverColor: Colors.white,
                          fillColor: Colors.white,
                          hintText: 'Day 11',
                        ),
                      ),
                    ),

                    Container(

                        child:
                        CustomButton(text: "Update", onPressed: ()
                        {
                          //uploadFile();
                          refUpdate.doc(userId).set({
                            'Title': title,
                            'Topic': topic,
                            'Date': dateText + timeText,
                            'Day': dayController.text
                          }).whenComplete(() {

                          });
                        })
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _launched = _launchInBrowser(toLaunch);
                      }),
                      child: const Text('Go Live'
                    ),)
                  ],),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  <Widget>[

                    const Center( child:Text("Add Recorded  Course",style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),),
                    const SizedBox(height: 5,),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Title',
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Discription',
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Duration',
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Fees',
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                        padding: const EdgeInsets.symmetric( vertical: 5),
                        child:
                        CustomButton(text:'Upload Video', onPressed:  () async {
                          {

                            FilePickerResult? result = await FilePicker.platform.pickFiles();

                            if (result != null) {
                              Uint8List? file = result.files.first.bytes;
                              String fileName = result.files.first.name;

                              UploadTask task = FirebaseStorage.instance.ref()
                                  .child("$userId/$fileName")
                                  .putData(file!);
                              TaskSnapshot snapshot = await task;
                              videoUrl = await snapshot.ref.getDownloadURL();

                              FirebaseFirestore.instance.collection('RcordedCourses').doc(userId).set(({
                                "imageUrl" : videoUrl
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
                        })
                    ),

                  ],
                ),
              )
            ],),
        )
    );
  }
}


