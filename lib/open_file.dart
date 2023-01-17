import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/show_image.dart';
import 'package:lepton_sci_web/student_screens/student_home.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'dart:ui' as ui;

var filename = "";

class OpenDoc extends StatefulWidget {
  const OpenDoc({Key? key}) : super(key: key);

  @override
  State<OpenDoc> createState() => _OpenDocState();
}

class _OpenDocState extends State<OpenDoc> {
  double _opacity = 0;
  final double _scrollPosition = 0;

  FirebaseStorage storageRef = FirebaseStorage.instance;


  CollectionReference ref = FirebaseFirestore.instance.collection('SlideImages');
  String imageUrl="";
  String img="";
  double progress = 0.0;


  void getImg() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("Profiles").doc(
        user!.uid ).get();
    setState(() {
      img = vari.data()!['studentImageUrl'];

      //imageUrl1=vari.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    getImg();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition <screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;


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
                  Image.asset("assets/images/SCIPRO.png",height: 40,),
                  SizedBox(width: screenSize.width*0.3),

                  Container(child: Text("Reorded Courses",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),

                  Expanded(child: Container()),
                  TextButton(onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginPage()));
                  }, child: const Text("",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),),),
                ],
              ),

            )
        ),
        body:
        Container(
      child:
      Column(
        children: [
          SizedBox(height: 30,),
          TextButton(onPressed: () async {

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

              FirebaseFirestore.instance.collection('Profiles').doc(userId).set(({
                "studentImageUrl" : imageUrl
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

          }, child: const Text("Upload")),
          const SizedBox(height: 20,),
          SizedBox(
              height: screenSize.height*1/4,
              width: screenSize.width*1/8,
              child: LiquidCircularProgressIndicator(
                  value: progress/100,
                  valueColor:  AlwaysStoppedAnimation(Colors.pinkAccent),
                  backgroundColor:Colors.white,
                  direction: Axis.vertical,
                  center: Text("$progress%",style:  TextStyle(fontSize: screenSize.width*1/90))
              )
          ),
          SizedBox(height: 20,),

          Container(
              margin: const EdgeInsets.only(left: 50,top: 30),
              child:
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(img.toString()),
              )
          ),
          TextButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowImage()));

          }, child: Text("Show Image",style: TextStyle(fontSize: 20,color: Colors.red),))


        ],
      )

    )
    );
  }
}

