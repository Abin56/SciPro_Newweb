import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'student_login_page.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      decoration: BoxDecoration(
          gradient:
          LinearGradient(colors: [Color(0xff2f2483)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: height * 0.2,
              child: Text(
                'reset password'.toUpperCase(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color:Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.15),
              height: height * 0.85,
              decoration: BoxDecoration(
                  color:  Color(0xff52b7ee),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: ListView(
                children: [
                  SizedBox(height: height * 0.08),

                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: Container(
                      child:
                      Image.asset('assets/images/Asset3.png',width: 110,height: 170,),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Your Email * ",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.blue),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50)),
                    onPressed: ()async{
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController.text)
                          .then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> StudentLoginPage()));
                      });
                    },
                    child: Text("Reset"),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}