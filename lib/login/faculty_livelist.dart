import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lepton_sci_web/login/room_id_pass.dart';
import 'package:lepton_sci_web/widgets/button_Container.dart';

import '../meeting_screens/start_meeting.dart';
import '../model/live_model.dart';

class FacultyLiveCourseList extends StatelessWidget {
  const FacultyLiveCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("LiveCourselist")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final data = LiveRoomModel.fromJson(
                            snapshot.data!.docs[index].data());
                        return GestureDetector(
                          onTap: () {
                            log(data.id);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return NewWaitingRoomScreen(
                                  course:data.courseTitle ,
                                  username: data.facultyName,
                                  roomid: data.roomID,
                                  id: data.id,
                                );
                              },
                            ));
                          },
                          child: ButtonContainerWidget(
                            curving: 20,
                            colorindex: 0,
                            height: 200,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                data.courseTitle,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: snapshot.data!.docs.length);
                } else {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              })),
    );
  }
}
