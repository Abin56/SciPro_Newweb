import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/student_screens/student_home.dart';
import 'package:open_file/open_file.dart';



import '../Login_signup/student_login_page.dart';
import 'admin/admin_panel.dart';
import 'create_profile.dart';
import 'faculty_screens/faculty_screen.dart';
import 'main_screens/admin.dart';
import 'main_screens/admin_page.dart';

class AuthService {
  //for all firebase auth
  final auth = FirebaseAuth.instance;
  //for creat user defining a function
  //3 parameters context
  void createUser(context,email,password)async {
    try{
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) =>CreateProfile()))
      });
    }catch(e){
      errorBox(context, e);
    }

  }
//loginUser function for login user
  void createStudentUser(context,email,password)async {
    try{
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>StudentHome()))
      });
    }catch(e){
      errorBox(context, e);
    }

  }
  void loginUser(context,email,password)async{
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  Admin()))
      });
    } catch(e){
      errorBox(context, e);
    }

  }

  void adminUser(context,email,password)async{
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  AdminPanel()))
      });
    } catch(e){
      errorBox(context, e);
    }

  }
//for signout
  void StudentsignOut(context)async{
    try{
      await auth.signOut().then((value) =>
      {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => StudentLoginPage()), (route) => false)
      });
    }catch(e){
      errorBox(context, e);
    }
  }

  void facultyLog(context,email,password)async{
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  FacultyScreen()))
      });
    } catch(e){
      errorBox(context, e);
    }

  }
//errorBox for error displaying
  void errorBox(context,e){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Text(e.toString()),
          );
        });
  }
}