import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepton_sci_web/main_screens/selected_recorded_course.dart';


import '../admin/admin_rec_courses.dart';
import '../model_classes/course_model.dart';

var courseID = "";

class RecordedClasses extends StatefulWidget {
  const RecordedClasses({Key? key}) : super(key: key);

  @override
  _RecordedClassesState createState() => _RecordedClassesState();
}

class _RecordedClassesState extends State<RecordedClasses> {
  String name = "";
  String courseid = "";
  //List<Map<String,dynamic>> data = [
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
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
        body: Stack(
            children:[
              Center(
                child: Container(
                    width: screenSize.width*1/3 ,
                    margin: EdgeInsets.only(top: 10,),
                    //padding: EdgeInsets.symmetric(horizontal: screenSize.width*1/4),
                    child:
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('RecordedCourses').snapshots(),
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
                                return  ListTile(
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
                                  //leading: CircleAvatar(
                                    //backgroundImage: NetworkImage(data['profilePhoto']),
                                 // ),
                                  trailing:Text(
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
                                  onTap: () {
                                   arec_courseID = data['CourseID'];
                                  // print(courseID);
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) => SelectedRecordedCourse(courseId: arec_courseID)
                                     ),
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
                                    data['CourseSubTitle'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing:Text(
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

                                  },
                                );
                              }
                              return Container();
                            });
                      },
                    ),
                ),
              ),
              Container()
            ])
    );
  }
}
