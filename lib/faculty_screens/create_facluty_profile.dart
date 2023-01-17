
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';



import '../login/sign_in_screen.dart';
import '../utils/top_bar_contents.dart';



class FacultyHomePage extends StatefulWidget {
  String? name,place,subject,email,ifsc,mobilrnumber,bankaccountnumber,bank,imageUrl;
  FacultyHomePage ({Key? key, this.name,this.place,this.subject,this.imageUrl,
    this.mobilrnumber,this.ifsc,this.bank,this.bankaccountnumber,this.email}) : super(key: key);

  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {
  double _opacity = 0;
  final double _scrollPosition = 0;
  var loginUser = FirebaseAuth.instance.currentUser;

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
    TextEditingController subject = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController ifsc = TextEditingController();
    TextEditingController mobilenumber = TextEditingController();
    TextEditingController aadharnumber = TextEditingController();
    TextEditingController bankaccountnumber= TextEditingController();
    TextEditingController bank = TextEditingController();

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
        'subject': subject.text,
        'email': email.text,
        'mobilenumber': mobilenumber.text,
        'aadhar': aadharnumber.text,
        'bankaccountnumber': bankaccountnumber.text,
        'bank': bank.text,
        'ifsc': ifsc.text,
      }));
      //print(url);
    }

    return Scaffold(
      //backgroundColor: Colors.blueAccent,
        extendBodyBehindAppBar: false,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width,70),
          child: TopBarContents(_opacity),
        ),
        body:
        SingleChildScrollView(
            child:
            Container(
              //margin: const EdgeInsets.only(top: 2),
                color: Color(0xFF49a9f8),
                child:
                Column(

                    children: [
                      const SizedBox(height: 15,),

                      const Text('Add or Delete Faculties ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red),),
                      const SizedBox(height: 30,),
                      TextButton(onPressed: () async {

                        FilePickerResult? result = await FilePicker.platform.pickFiles();

                        if (result != null) {
                          Uint8List? file = result.files.first.bytes;
                          String fileName = result.files.first.name;

                          UploadTask task = FirebaseStorage.instance.ref()
                              .child("$userId/$fileName")
                              .putData(file!);
                          TaskSnapshot snapshot = await task;
                          imageUrl = await snapshot.ref.getDownloadURL();

                          FirebaseFirestore.instance.collection('Profiles').doc(userId).set(({
                            "imageUrl" : imageUrl
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
                          height: 200,
                          width: 200,
                          child: LiquidCircularProgressIndicator(
                              value: progress,
                              valueColor: const AlwaysStoppedAnimation(Colors.pinkAccent),
                              backgroundColor:Colors.white,
                              direction: Axis.vertical,
                              center: Text("$progress%",style: const TextStyle(fontSize: 10))
                          )
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child:
                        TextField(
                          controller: name,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                              hintText: "Faculty Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child: TextField(
                          controller: place,
                          decoration: InputDecoration(
                              hintText: "Place",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child: TextField(
                          controller: subject,
                          decoration: InputDecoration(
                              hintText: "Subject",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child: TextField(
                          controller: mobilenumber,
                          decoration: InputDecoration(
                              hintText: "Mobile Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child: TextField(
                          controller: aadharnumber,
                          decoration: InputDecoration(
                              hintText: "Adhaar Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child: TextField(
                          controller: bankaccountnumber,
                          decoration: InputDecoration(
                              hintText: "Bank Account Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child: TextField(
                          controller: bank,
                          decoration: InputDecoration(
                              hintText: "Bank Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                        child: TextField(
                          controller: ifsc,
                          decoration: InputDecoration(
                              hintText: "IFSC Code",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      MaterialButton(
                        onPressed: () {
                          //uploadFile();
                          ref.doc(userId).set({
                            'imageUrl': imageUrl,
                            'Name': name.text,
                            'place': place.text,
                            'subject': subject.text,
                            'email': email.text,
                            'mobilenumber': mobilenumber.text,
                            'bankaccount number': bankaccountnumber.text,
                            'bank': bank.text,
                            'ifsc': ifsc.text,
                            'aadhar': aadharnumber.text,
                          }).whenComplete(() {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (_) => const Login()));
                          });
                        },
                        child: const Text(
                            "save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red)
                        ),
                      ),
                      const SizedBox(height: 15,),
                    ]
                )
            )
        )
    );
  }
}
