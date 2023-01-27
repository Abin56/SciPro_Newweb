import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/admin/admin_hybrid_courses.dart';

import '../auth_service.dart';
import '../faculties/faculties_screen.dart';
import '../liveSection/live_section_selection_screen.dart';
import '../main_screens/selected_recorded_course.dart';
import '../recorded_section/reco_section_screen.dart';
import '../study_material_section/list_of_S-material.dart';
import 'admin_live_courses.dart';
import 'admin_rec_display.dart';

var arCourseID = "";

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            height: 70,
            width: screenSize.width,
            color: Color(0xff19191a),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 100,
                ),
                Image.asset(
                  "assets/images/SCIPRO.png",
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: screenSize.width * 0.3),
                Container(
                    child: Text(
                  "SciPro Admin panel",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
                Expanded(child: Container()),
                InkWell(
                    onTap: () {
                      AuthService().StudentsignOut(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(screenSize.height * 1 / 70),
                      child: Image.asset("assets/images/sout.png",
                          height: 30, width: 30),
                    ))
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.black54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenSize.width / 3,
                color: Colors.green,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * 1 / 20,
                    ),
                    Text(
                      "Hi!  Admin",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: screenSize.width * 1 / 70),
                    ),
                    SizedBox(
                      height: screenSize.height * 1 / 20,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RecordedSectionListScreen()),
                          );
                        },
                        child: Container(
                            width: screenSize.width * 1 / 4,
                            height: screenSize.height * 1 / 8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Recorded Courses",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenSize.width * 1 / 70),
                                  ),
                                  Icon(Icons.tv)
                                ])),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 1 / 20,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LiveSectionSelectionScreen()),
                          );
                        },
                        child: Container(
                            width: screenSize.width * 1 / 4,
                            height: screenSize.height * 1 / 8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Live Courses",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenSize.width * 1 / 70),
                                  ),
                                  Icon(Icons.computer)
                                ])),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 1 / 20,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AdminHybrid(arCourseId: arCourseID)),
                          );
                        },
                        child: Container(
                            width: screenSize.width * 1 / 4,
                            height: screenSize.height * 1 / 8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Scipro Hybrid Courses",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenSize.width * 1 / 70),
                                  ),
                                  Icon(Icons.school)
                                ])),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 1 / 20,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FacultyScreen()),
                          );
                        },
                        child: Container(
                            width: screenSize.width * 1 / 4,
                            height: screenSize.height * 1 / 8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Faculties ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenSize.width * 1 / 70),
                                  ),
                                  Icon(Icons.approval)
                                ])),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 1 / 20,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ListofStudyMaterialScreen();
                            },
                          ));
                        },
                        child: Container(
                            width: screenSize.width * 1 / 4,
                            height: screenSize.height * 1 / 8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "StudyMaterials ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenSize.width * 1 / 70),
                                  ),
                                  Icon(Icons.image)
                                ])),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 1 / 20,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           LiveSectionSelectionScreen()),
                          // );
                        },
                        child: Container(
                            width: screenSize.width * 1 / 4,
                            height: screenSize.height * 1 / 8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.06),
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Ads for Book",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenSize.width * 1 / 70),
                                  ),
                                  Icon(Icons.book)
                                ])),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
