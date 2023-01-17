import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/auth_methods.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class FacultyActionProfile extends StatefulWidget {
  const FacultyActionProfile({Key? key}) : super(key: key);

  @override
  State<FacultyActionProfile> createState() => _FacultyActionProfileState();
}

class _FacultyActionProfileState extends State<FacultyActionProfile> {
  final AuthMethods _authMethods = AuthMethods();
  late String nameController;
  late String name;

  String studyMaterialUrl="";
  double progress = 0.0;
  final userId = loginUser!.uid.toString();

  final ScrollController _scrollController = ScrollController();
  final double _scrollPosition = 0;
  double _opacity = 0;

  final firebase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  get getImage => null;

  getCurrentUser() {
    final user = auth.currentUser;
    //user not empty it asssign to user
    if (user != null) {
      loginUser = user;
    }
  }
//final userId = loginUser.toString();
  String qualification = "loading";
  String subject = "loading";
  String email = "loading";
  String address ="loading";
  String job ="loading";
  String mobilenumber="loading";

  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("Faculties").doc(
        user!.uid ).get();
    setState(() {
      qualification = vari.data()!['ifsc'];
      subject=vari.data()!['subject'];
      email = vari.data()!['email'];
      mobilenumber = vari.data()!['mobile number'];
      job=vari.data()!['job'];
      address = vari.data()!['aadhar'];
      //imageUrl1=vari.toString();
    });
  }
  @override
  void initState() {

    nameController = _authMethods.user.photoURL! ;
    name = _authMethods.user.displayName!;
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.70
        ? _scrollPosition / (screenSize.height * 0.70)
        : 1;
    return SingleChildScrollView(
        child:
        Container(
        width: screenSize.width*1/3,
          height: screenSize.height*2,
          child:
          Column(
              children: [
                Container(
                  height: screenSize.height*0.7,
                  width: screenSize.width*1/3,
                  decoration: BoxDecoration(
                      //borderRadius: const BorderRadius.all( Radius.circular(40)),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.gradientFirst.withOpacity(0.9),
                          AppColor.gradientSecond],
                        begin: const FractionalOffset(0.0, 0.4),
                        end: Alignment.topRight,
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenSize.width*1/3,
                        child:CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(nameController),
                        ) ,
                      ),
                            Text(name,style: const TextStyle(color: Colors.red,fontSize: 20,
                                fontWeight: FontWeight.bold),),
                    ],),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  <Widget>[

                        const Center( child:Text("Update Study Materials",style: TextStyle(
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
                            CustomButton(text:'Upload Study Materials', onPressed: () async{

                              FilePickerResult? result = await FilePicker.platform.pickFiles();

                              if (result != null) {
                                Uint8List? file = result.files.first.bytes;
                                String fileName = result.files.first.name;

                                UploadTask task = FirebaseStorage.instance.ref()
                                    .child("$userId/$fileName")
                                    .putData(file!);
                                TaskSnapshot snapshot = await task;
                                studyMaterialUrl = await snapshot.ref.getDownloadURL();

                                FirebaseFirestore.instance.collection('RcordedCourses').doc(userId).set(({
                                  "studyMaterialUrl" : studyMaterialUrl
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

                            })
                        ),
                      ],
                    )
                )
              ],),
        )
    );
  }
}

