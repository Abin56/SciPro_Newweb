import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lepton_sci_web/model/reco_course_addModel.dart';
import 'package:lepton_sci_web/recorded_section/recorded_playlistvideos.dart';

import '../widgets/button_Container.dart';

class AllCourseVideos extends StatelessWidget {
  const AllCourseVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Courses'),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("RecordedCourselist")
                    .snapshots(),
                builder: (context, snapshots) {
                  return (snapshots.connectionState == ConnectionState.waiting)
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : ListView.separated(
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = RecordedCourseAddModel.fromJson(
                                snapshots.data!.docs[index].data());

                            if (snapshots.hasData) {
                              return GestureDetector(
                                onTap: () {
                                  // Get.to(RecordedvideosPlayList(
                                  //     catData: data.courseName));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RecordedvideosPlayList(
                                                catData: data.courseTitle)),
                                  );
                                },
                                child: ButtonContainerWidget(
                                  curving: 30,
                                  colorindex: 0,
                                  height: 80,
                                  width: double.infinity,
                                  child: Center(
                                      child: Text(
                                    data.courseTitle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  )),
                                ),
                              );
                            } else {
                              return const Text('');
                            }
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        );
                },
              )),
        ));
  }
}
