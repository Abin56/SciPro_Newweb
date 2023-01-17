// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lepton_sci_web/model/faculty_profile_model.dart';
import 'package:lottie/lottie.dart';

import '../widgets/button_container.dart';

class FacultiesIDandPassScreen extends StatelessWidget {
  TextEditingController idContoller = TextEditingController();

  TextEditingController nameContoller = TextEditingController();
  TextEditingController emailContoller = TextEditingController();

  TextEditingController passwordContoller = TextEditingController();
  FacultiesIDandPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          height: 2500,
          width: 800,
          child: ListView(
            children: [
              SizedBox(
                  height: 500,
                  width: 500,
                  child: LottieBuilder.asset(
                      "assets/images/ld_password_lottie.json")),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameContoller,
                decoration: InputDecoration(
                    hintText: "Enter Facultie Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailContoller,
                decoration: InputDecoration(
                    hintText: "Enter Facultie email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: idContoller,
                decoration: InputDecoration(
                    hintText: "Enter to create ID",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordContoller,
                decoration: InputDecoration(
                    hintText: "Enter  password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  final addtofirebase = FaculityProfileModel(
                      facultyemail: emailContoller.text.trim(),
                      facultyName: nameContoller.text.trim(),
                      facultyid: idContoller.text.trim(),
                      id: '',
                      facultyPassword: passwordContoller.text.trim());

                  FacultyProfileToFireBase()
                      .facultyProfileController(addtofirebase, context);
                },
                child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 60,
                  width: 100,
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
