import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveClasses extends StatefulWidget {
  const LiveClasses({Key? key}) : super(key: key);

  @override
  _LiveClassesState createState() => _LiveClassesState();
}

class _LiveClassesState extends State<LiveClasses> {
  String name = "";
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
                  width: screenSize.width*1/3,
                  margin: EdgeInsets.only(top: 10),
                  child:
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('LiveCourseList').snapshots(),
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
                  ),),
              )
            ])
    );
  }
}
