import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/login/login_screen.dart';
import '../Login_signup/admin_login_page.dart';
import '../services/auth_methods.dart';
import 'faculty_livelist.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthMethods _authMethods = AuthMethods();

  String _facultyId = "loading";
  String _password = "loading";
  String useId = "BQW9rV5Idqca9e0RrPbLzOkh6Ri1";

  final TextEditingController _facultyController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getFacultyId();
    getPassword();
  }

  void getFacultyId() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Admin")
        .doc("facultyCredential")
        .get();
    setState(() {
      _facultyId = vari.data()!['FacultyID'];
    });
  }

  void getPassword() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Admin")
        .doc("facultyCredential")
        .get();
    setState(() {
      _password = vari.data()!['Password'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              height: 70,
              width: screenSize.width,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Image.asset(
                    "assets/images/SCIPRO.png",
                    height: 40,
                    width: 120,
                  ),
                  SizedBox(width: screenSize.width * 0.3),
                  Container(
                      child: Text(
                    "Login ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                  Expanded(child: Container()),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminLoginPage()));
                    },
                    child: Text(
                      "Admin Login",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: screenSize.width * 1 / 70),
                    ),
                  ),
                ],
              ),
            )),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.4,
                width: screenSize.width / 3,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    gradient: LinearGradient(
                      colors: [Colors.black45, Colors.black45],
                      begin: FractionalOffset(0.0, 0.4),
                      end: Alignment.topRight,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login \n   as",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 1 / 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Image.asset(
                            'assets/images/SCIPRO.png',
                            height: 25,
                            width: 100,
                          ),
                        ),
                        Text(
                          "Student",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize.width * 1 / 40),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ));

                        // Navigator.pushNamed(context, '/studentlogin');
                      },
                      child: Container(
                          width: 400,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: screenSize.width * 1 / 70),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: screenSize.height * 0.4,
                  width: screenSize.width / 3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      gradient: LinearGradient(
                        colors: [Colors.black45, Colors.black45],
                        begin: const FractionalOffset(0.0, 0.4),
                        end: Alignment.topRight,
                      )),
                  child: Column(
                    children: [
                      Text(
                        "Login \n   as",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: screenSize.width * 1 / 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset(
                              'assets/images/SCIPRO.png',
                              height: 25,
                              width: 100,
                            ),
                          ),
                          Text(
                            "Faculty",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: screenSize.width * 1 / 50),
                          ),
                        ],
                      ),
                      Container(
                          //color: Colors.cyanAccent,
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0)),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              )),
                          child: TextField(
                            controller: _facultyController,
                            decoration: InputDecoration(
                                hintText: "Enter Your facultyID"),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          //color: Colors.cyanAccent,
                          height: screenSize.height * 0.05,
                          width: screenSize.width * 0.25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0)),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              )),
                          child: TextField(
                            controller: _passwordController,
                            decoration:
                                InputDecoration(hintText: "Enter password"),
                          )),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () async {
                          //>>>>>>>>>>>>>>>>>Checking ID<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                          CollectionReference cat = FirebaseFirestore.instance
                              .collection("FacultyProfiles");
                          Query query = cat.where("facultyid",
                              isEqualTo: _facultyController.text.trim());
                          QuerySnapshot querySnapshot = await query.get();
                          final docData = querySnapshot.docs
                              .map((doc) => doc.data())
                              .toList();
                          log(query.toString());
                          log(docData.toString());
                          //
                          //>>>>>>>>>>>>>>>>>>>Checking password<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                          CollectionReference pass = FirebaseFirestore.instance
                              .collection("FacultyProfiles");
                          Query queries = pass.where("facultyPassword",
                              isEqualTo: _passwordController.text.trim());
                          QuerySnapshot querySnapshott = await queries.get();
                          final docDataa = querySnapshott.docs
                              .map((doc) => doc.data())
                              .toList();
                          log(query.toString());
                          log(docDataa.toString());

                        
                          if (docDataa.isNotEmpty && docData.isNotEmpty) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return FacultyLiveCourseList();
                              },
                            ));
                            log('Correct password');
                          } else {
                            log('Wrong password');
                          }
                        },
                        child: Container(
                            width: 400,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: screenSize.width * 1 / 70),
                              ),
                            )),
                      )
                    ],
                  )),
            ],
          ),
        ])));
  }
}
