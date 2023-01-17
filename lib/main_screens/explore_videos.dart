import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../model_classes/course_model.dart';
import '../video_player_final.dart';

var videoUrl = "";

class ExploreVideos extends StatefulWidget {
  final String selectedCourseId;
  const ExploreVideos({Key? key,required this.selectedCourseId}) : super(key: key);

  @override
  _ExploreVideosState createState() => _ExploreVideosState(selectedRecordedCourseId: selectedCourseId);
}

class _ExploreVideosState extends State<ExploreVideos> {
  String? selectedRecordedCourseId;
  _ExploreVideosState({
    required this.selectedRecordedCourseId,
  });
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
                    stream: FirebaseFirestore.instance.collection('RecordedCourseList')
                        .where('CourseID',isEqualTo: selectedRecordedCourseId).snapshots(),
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
                                  data['CourseSubTitle'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  data['CourseID'],
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
                                  data['VideoNumber'],
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
                                  videoUrl = data['ImageUrl'];
                                  print(videoUrl);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPlayerFinal()
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
