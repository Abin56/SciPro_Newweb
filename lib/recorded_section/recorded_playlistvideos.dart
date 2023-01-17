import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../getx/getx.dart';
import '../model/video_fecting_model.dart';

final ScrollController _scrollController = ScrollController();

class RecordedvideosPlayList extends StatelessWidget {
  final getxController = Get.put(SciProController());
  var catData;

  RecordedvideosPlayList({required this.catData, Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    log(catData);
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: AnimationLimiter(
            child: GetBuilder<SciProController>(
                init: getxController,
                initState: (_) {},
                builder: (_) {
                  return getxController.categoryCollections.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                          ),
                        )
                      : StreamBuilder(
                          stream: getxController.getProduct(catData),
                          builder: (context,
                              AsyncSnapshot<List<VideoFectingModel>> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    final data = snapshot.data![index];
                                    return SizedBox(
                                      height: 100,
                                      width: 400,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    data.videoImage),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            data.videoName,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        "RecordedCourse_videos")
                                                    .doc(data.id)
                                                    .delete();
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                  itemCount: snapshot.data!.length);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                              );
                            }
                          });
                })),
      ),
    );
  }
}
