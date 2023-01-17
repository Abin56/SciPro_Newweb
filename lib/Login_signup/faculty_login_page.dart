import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_service.dart';
import 'Register_Page.dart';



class FacultyLoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController facultyId = TextEditingController();

  AuthService service = AuthService();

  String studyMaterialUrl="";
  double progress = 0.0;


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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

                  const SizedBox(width: 100,),
                  Image.asset("assets/images/SCIPRO.png"),
                  SizedBox(width: screenSize.width*0.3),

                      Container(
                        child: Text("Login ",style:
                        TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),

                  Expanded(child: Container()),
                ],
              ),

            )
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width*1/3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login ",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 20),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 80)),
                    onPressed: ()async{
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      //if email and password is not empty it will take action
                      if(emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty){
                        service.facultyLog(context, emailController.text,
                            passwordController.text);
                        pref.setString("email", emailController.text);
                      } else {
                        service.errorBox(context, "You have to enter email and password");
                      }
                    },
                    child: Text("Login")),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                }, child: Text("Forgot passwor?  RESET"),),
              ],
            ),
          ),
        )
    );
  }
}