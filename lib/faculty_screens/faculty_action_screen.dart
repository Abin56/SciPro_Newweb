import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/faculty_action_screens/faculty_action_profile.dart';


import '../live/live_one.dart';
import '../live/live_two.dart';
import '../services/auth_methods.dart';
import '../utils/app_colors.dart';
import '../utils/top_bar_contents.dart';
import '../widgets/journy_page_button.dart';
import 'faculty_profile_screen.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class FacultyActionScreen extends StatefulWidget {
  const FacultyActionScreen({Key? key}) : super(key: key);

  @override
  State<FacultyActionScreen> createState() => _FacultyActionScreenState();
}

class _FacultyActionScreenState extends State<FacultyActionScreen> {

  final AuthMethods _authMethods = AuthMethods();

  //late String place;
  final ScrollController _scrollController = ScrollController();
  final double _scrollPosition = 0;
  double _opacity = 0;

  final firebase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  get getImage => null;

  TextEditingController duration = TextEditingController();
  TextEditingController fees = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController durationRecordedcourse = TextEditingController();
  TextEditingController feesRecordedCourse = TextEditingController();
  TextEditingController descriptionRecordedCourse= TextEditingController();
  TextEditingController titleRcordedCourse = TextEditingController();
  TextEditingController durationLive = TextEditingController();
  TextEditingController feesLive = TextEditingController();
  TextEditingController descriptionLive = TextEditingController();
  TextEditingController titleLive = TextEditingController();

//final userId = loginUser.toString();
  String qualification = "loading";
  String subject = "loading";
  String email = "loading";
  String address ="loading";
  String job ="loading";
  String mobilenumber="loading";

  void getData() async {
   // User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("Admin").doc("RecordedClasses").get();
    setState(() {
      qualification = vari.data()!['recordedClassUrl'];
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

    //nameController = _authMethods.user.photoURL! ;
   // name = _authMethods.user.displayName!;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.70
        ? _scrollPosition / (screenSize.height * 0.70)
        : 1;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace:
        Container
          (
          height: 70,
          width: screenSize.width,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/SCIPRO.png"),
              const Text("My SciPRO",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
              Image.asset("assets/images/logut.png",height: 50,),
            ],
          ),

        )
    ),
    body: SingleChildScrollView(
      child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Text(qualification,style: TextStyle(fontSize: 20,color: Colors.red),),
            Row(
              children: [
                FacultyActionProfile(),
                LiveOne(),
                LiveTwo()
                ]),
    ]),
    )

    );
  }
}
