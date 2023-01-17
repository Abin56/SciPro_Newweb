
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lepton_sci_web/student_screens/student_home.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';



import '../auth_service.dart';
import '../utils/top_bar_contents.dart';

var filename = "";



class CreateStudentProfile extends StatefulWidget {
  String? name,place,specialization,email,mobilernumber,bank,imageUrl;
  CreateStudentProfile ({Key? key, this.name,this.place,this.imageUrl,
    this.mobilernumber,this.email}) : super(key: key);

  @override
  _CreateStudentProfileState createState() => _CreateStudentProfileState();
}

class _CreateStudentProfileState extends State<CreateStudentProfile> {
  double _opacity = 0;
  final double _scrollPosition = 0;
  var loginUser = FirebaseAuth.instance.currentUser;

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {

    var loginUser = FirebaseAuth.instance.currentUser;
    String user = loginUser.toString();
    double width = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition <screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    TextEditingController name = TextEditingController();
    TextEditingController place = TextEditingController();
    TextEditingController specialization = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController mobilenumber = TextEditingController();



    final userId = loginUser!.uid.toString();
    CollectionReference ref = FirebaseFirestore.instance.collection('Faculties');
    String imageUrl="";
    double progress = 0.0;


    uploadFile()async{
      final User? user = FirebaseAuth.instance.currentUser;
      var imageFile = FirebaseStorage.instance.ref().child(userId).child("/.jpg");
      // UploadTask task = imageFile.putFile(file!);
      //TaskSnapshot snapshot = await task;
      //imageUrl = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('faculty').doc(userId).set(({
        "imageUrl":imageUrl.toString(),
        'name': name.text,
        'place': place.text,
        'subject': specialization.text,
        'email': email.text,
        'mobilenumber': mobilenumber.text,
      }));
      //print(url);
    }

    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar:
        AppBar(
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

              SizedBox(width: screenSize.width*1/20,),
              Image.asset("assets/images/SCIPRO.png"),
              SizedBox(width: screenSize.width*0.3),

              Container(child:
              Text("Login ",style:
              TextStyle(fontSize: screenSize.width*1/70,color: Colors.white,fontWeight: FontWeight.bold),)),

              Expanded(child: Container()),
              Container(child:
                  InkWell(
                    onTap: (){
                      authService.StudentsignOut(context);
                    },
                    child:
                    Text("Log Out ",style:
                    TextStyle(fontSize: screenSize.width*1/70,
                        color: Colors.white,fontWeight:
                        FontWeight.bold),)),)
            ],
          ),

        )
    ),
        body:
        SingleChildScrollView(
            child:
            Container(
              //margin: const EdgeInsets.only(top: 2),
                color: Colors.white,
                child:
                Column(

                    children: [
                      SizedBox(height: screenSize.height*1/20,),

                      Text('Create Profile ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*1/70,color: Colors.red),),
                      SizedBox(height: screenSize.height*1/20,),
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

                      Padding(
                        padding:  EdgeInsets.only(top: screenSize.height*1/20,right: screenSize.width*1/3,left: screenSize.width*1/3),
                        child:
                        TextField(
                          controller: name,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(

                              iconColor: Colors.greenAccent,
                              hintText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: screenSize.height*1/20,right: screenSize.width*1/3,left: screenSize.width*1/3),
                        child: TextField(
                          controller: place,
                          decoration: InputDecoration(
                              hintText: "Place",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:screenSize.height*1/20,right: screenSize.width*1/3,left: screenSize.width*1/3),
                        child: TextField(
                          controller: specialization,
                          decoration: InputDecoration(
                              hintText: "Specialization",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:screenSize.height*1/20,right: screenSize.width*1/3,left: screenSize.width*1/3),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 15,right: screenSize.width*1/3,left: screenSize.width*1/3),
                        child: TextField(
                          controller: mobilenumber,
                          decoration: InputDecoration(
                              hintText: "Mobile Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(height: screenSize.height*1/20,),
                      MaterialButton(
                        onPressed: () {
                          //uploadFile();
                          ref.doc(userId).set({
                            'studentImageUrl': imageUrl,
                            'Name': name.text,
                            'place': place.text,
                            'specialization': specialization.text,
                            'email': email.text,
                            'mobilenumber': mobilenumber.text,

                          }).whenComplete(() {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (_) => const StudentHome()));
                          });
                        },
                        child:  Text(
                            "save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenSize.width*1/70,color: Colors.red)
                        ),
                      ),
                      SizedBox(height: screenSize.height*1/20,),
                    ]
                )
            )
        )
    );
  }
}
