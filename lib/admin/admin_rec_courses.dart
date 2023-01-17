import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../course_contents/recorded_display_admin.dart';
import '../course_contents/subscibed_students.dart';
import '../model_classes/course_model.dart';
import '../widgets/button_container.dart';

var arec_courseID = "";

class AdminRecCourses extends StatefulWidget {
  const AdminRecCourses({Key? key}) : super(key: key);

  @override
  _AdminRecCoursesState createState() => _AdminRecCoursesState();
}

class _AdminRecCoursesState extends State<AdminRecCourses> {
  String name = "";
  String courseid = "";
  //List<Map<String,dynamic>> data = [
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        )),
        body: Stack(children: [
          Positioned(
            top: 10,
            right: 600,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecordedSubscribedStudents()),
                );
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 110,
                width: 400,
                child: Center(
                  child: Text(
                    'Subscribed Students',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: screenSize.width * 1 / 3,
            margin: EdgeInsets.only(
              top: 10,
            ),
            //padding: EdgeInsets.symmetric(horizontal: screenSize.width*1/4),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('RecordedCourses')
                  .snapshots(),
              builder: (context, snapshots) {
                return (snapshots.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index].data()
                              as Map<String, dynamic>;

                          if (name.isEmpty) {
                            return ListTile(
                              title: Text(
                                data['CourseTitle'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['CourseFee'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              //leading: CircleAvatar(
                              //backgroundImage: NetworkImage(data['profilePhoto']),
                              // ),
                              trailing: Text(
                                data['CourseDuration'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              tileColor: Colors.black45,
                              textColor: Colors.white,
                              hoverColor: Colors.red,
                              selectedColor: Colors.cyan,
                              onTap: () {
                                arec_courseID = data['CourseID'];
                                //print(arec_courseID);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecDisplayAdmin(
                                          courseId: arec_courseID)),
                                );
                              },
                            );
                          }
                          if (data['CourseTitle']
                              .toString()
                              .toLowerCase()
                              .startsWith(name.toLowerCase())) {
                            return ListTile(
                              title: Text(
                                data['CourseTitle'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['CourseFee'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                data['CourseDuration'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              tileColor: Colors.black45,
                              textColor: Colors.white,
                              hoverColor: Colors.red,
                              selectedColor: Colors.cyan,
                              onTap: () {},
                            );
                          }
                          return Container();
                        });
              },
            ),
          ),
          Container()
        ]
        )
        );
  }
}
