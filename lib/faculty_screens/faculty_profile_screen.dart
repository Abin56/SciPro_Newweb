import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../services/auth_methods.dart';
import '../widgets/journy_page_button.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class FacultyProfileScreen extends StatefulWidget {
  const FacultyProfileScreen({Key? key}) : super(key: key);

  @override
  State<FacultyProfileScreen> createState() => _FacultyProfileScreenState();
}

class _FacultyProfileScreenState extends State<FacultyProfileScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late String nameController;
  late String name;
  late String place;

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
      qualification = vari.data()!['qualification'];
      subject=vari.data()!['subject'];
      email = vari.data()!['email'];
      mobilenumber = vari.data()!['mobile number'];
      job=vari.data()!['job'];
      address = vari.data()!['address'];
      //imageUrl1=vari.toString();
    });
  }

  void getImg() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance.collection("Faculties").doc(
        user!.uid ).get();
    setState(() {
      qualification = vari.data()!['qualification'];
      subject=vari.data()!['subject'];
      email = vari.data()!['email'];
      mobilenumber = vari.data()!['mobile number'];
      job=vari.data()!['job'];
      address = vari.data()!['address'];
      //imageUrl1=vari.toString();
    });
  }




  @override
  void initState() {

    nameController = _authMethods.user.photoURL! ;
    name = _authMethods.user.displayName!;
    getData();
    getImg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return
    Scaffold(
    body:
        SingleChildScrollView(
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                [Container(
                          child:
                 Column(children: [
                 Stack(
                  children:
                  [
                    Row(
                      children: [
                        Container(
                            height: 250,
                            width: screenSize.width*1/3,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.white10,
                                    Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                              ),
                            ),
                            child:  Text("")),
                        Container(
                            height: 250,
                            width: screenSize.width*0.7,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.blue,
                                    Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 33, top: 100),
                                  child: Text(qualification,style: const TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold)),
                                ),
                                //Container(
                                 // margin: const EdgeInsets.only(left: 25, top: 100),
                                  //child: Text(place,style: const TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold)),
                                //),

                              ],
                            )
                        )
                      ],
                    ),

                    const SizedBox(height: 20),
                    Container(
                        margin: const EdgeInsets.only(left: 50,top: 30),
                        child:
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(nameController),
                        )
                    )
                  ]),
                 SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(35),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row( children:
                            const [
                              Icon(Icons.cast_for_education_outlined, size: 25,color: Colors.lightBlueAccent,),
                              SizedBox(width: 10,),
                              Text("Qualification",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.lightBlueAccent),),
                            ]),
                            Text(qualification, style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),
                            Row( children:
                            const [
                              Icon(Icons.subject,size: 25,color: Colors.lightBlueAccent,),
                              SizedBox(width: 10,),
                              Text("Subject",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.lightBlueAccent),),
                            ]),
                            Text(subject,style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),
                            Row( children:
                            const [
                              Icon(Icons.email,size: 25,color: Colors.lightBlueAccent,),
                              SizedBox(width: 10,),
                              Text("Email",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.lightBlueAccent),),
                            ]),
                            Text(email,style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),
                            Row( children:
                            const [
                              Icon(Icons.mobile_off_outlined, size: 25,color: Colors.lightBlueAccent,),
                              SizedBox(width: 10,),
                              Text("Mobile Number",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.lightBlueAccent),),
                            ]),
                            Text(mobilenumber,style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),
                            Row( children:
                            const [
                              Icon(Icons.work_rounded, size: 25,color: Colors.lightBlueAccent,),
                              SizedBox(width: 10,),
                              Text("Job",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.lightBlueAccent),),
                            ]),
                            Text(job,style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),
                            Row( children:
                            const [
                              Icon(Icons.home,size: 25,color: Colors.lightBlueAccent,),
                              SizedBox(width: 10,),
                              Text("Address",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.lightBlueAccent),),
                            ]),
                            Text(address,style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                          ],),
                      ),
                      JournyPageButton(
                          text: "My Documents",
                          icon: Icons.document_scanner,
                          onPressed: (){

                          }),
                      JournyPageButton(
                          text: "My Recorded Classes",
                          icon: Icons.school_outlined,
                          onPressed: (){

                          }),
                      JournyPageButton(
                          text: "My Live Classes",
                          icon: Icons.tv,
                          onPressed: (){

                          })
                    ]),
              ),
                 ],)
                      ),
                  Column(children: [
                    Container(child:
                    SingleChildScrollView(child:
                    Column
                      (
                      children:
                      [
                        const Text("Add new Documments",style: TextStyle(
                          color: Colors.black87,fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: title,
                            decoration: InputDecoration(
                                hintText: "Title",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: description,
                            decoration: InputDecoration(
                                hintText: "Description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: duration,
                            decoration: InputDecoration(
                                hintText: "Duration",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: fees,
                            decoration: InputDecoration(
                                hintText: "Fees",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        JournyPageButton(text: "Upload Documents", icon: Icons.book, onPressed: ()
                        {

                        })

                    ],)
                      ,)
                    ),
                    Container(child:
                    SingleChildScrollView(child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        const Text("Add Recorded Course",style: TextStyle(
                            color: Colors.black87,fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: titleRcordedCourse,
                            decoration: InputDecoration(
                                hintText: "Title",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: descriptionRecordedCourse,
                            decoration: InputDecoration(
                                hintText: "Description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: durationRecordedcourse,
                            decoration: InputDecoration(
                                hintText: "Duration",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: feesRecordedCourse,
                            decoration: InputDecoration(
                                hintText: "Fees",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        JournyPageButton(text: "Upload Recorded Courses", icon: Icons.book, onPressed: ()
                        {

                        })

                      ],)
                      ,)
                    ),
                    Container(child:
                    SingleChildScrollView(child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        const Text("Add Live Course",style: TextStyle(
                            color: Colors.black87,fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: titleLive,
                            decoration: InputDecoration(
                                hintText: "Title",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: descriptionLive,
                            decoration: InputDecoration(
                                hintText: "Description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: durationLive,
                            decoration: InputDecoration(
                                hintText: "Duration",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,right: 300,left: 300),
                          child: TextField(
                            controller: feesLive,
                            decoration: InputDecoration(
                                hintText: "Fees",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        JournyPageButton(text: "Upload Live Courses", icon: Icons.book, onPressed: ()
                        {

                        })

                      ],)
                      ,)
                    ),

                  ],)
                    ]),
        )
    );
  }
}


