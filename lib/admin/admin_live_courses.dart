import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../course_contents/upload_recorded.dart';
import '../main_screens/rcorded_classes.dart';
import '../main_screens/selected_recorded_course.dart';

var arCourseID = "";

class AdminLive extends StatefulWidget {
  final String arCourseId;
  const AdminLive({
    Key? key,
    required this.arCourseId,
  }) : super(key: key);

  @override
  State<AdminLive> createState() => _AdminLiveState();
}

class _AdminLiveState extends State<AdminLive> {
  String name = "";
  //List<Map<String,dynamic>> data = [
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black54,
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
          Container(
            //margin: EdgeInsets.only(left:20,top: 5,),
            width: screenSize.width * 1 / 3,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Course Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      "Faculty Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Topic",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Fees",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Container(
            width: screenSize.width * 1 / 3,
            //margin: EdgeInsets.only(left:20,top: 30,),
            padding: EdgeInsets.all(20),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('LiveCourses')
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
                              leading: Text(
                                data['FacultyName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                data['CourseTitle'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['CourseDuration'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              //leading: CircleAvatar(
                              //backgroundImage: NetworkImage(data['profilePhoto']),
                              // ),
                              trailing: Text(
                                data['CourseFee'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              tileColor: Colors.black45,
                              textColor: Colors.white,
                              hoverColor: Colors.red,
                              selectedColor: Colors.cyan,
                              onTap: () {
                                print(courseID);
                              },
                            );
                          }
                          if (data['FacultyName']
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
                                data['CourseDuration'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                data['CourseFee'],
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
          Container(
            margin: EdgeInsets.only(left: screenSize.width * 1 / 3),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 1 / 20,
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UploadRecorded()),
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Upload Live Course",
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
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.all(10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Edit Live Course",
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
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.all(10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Delete Live Course",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenSize.width * 1 / 70),
                              ),
                              Icon(Icons.description)
                            ])),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 1 / 20,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: screenSize.width * 2 / 3),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 1 / 20,
                ),
                Text(
                  "",
                  style: TextStyle(
                      color: Colors.black, fontSize: screenSize.width * 1 / 70),
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
                                SelectedRecordedCourse(courseId: arCourseID)),
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Upload Recorded Class",
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
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.all(10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Edit Recorded Class",
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
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.all(10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Delete Recorded Class ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenSize.width * 1 / 70),
                              ),
                              Icon(Icons.description)
                            ])),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 1 / 20,
                ),
              ],
            ),
          ),
        ]));
  }
}
