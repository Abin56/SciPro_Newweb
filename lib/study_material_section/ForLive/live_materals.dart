import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/getx/s_materials_getx.dart';
import 'package:lepton_sci_web/model/study_material/s_m_categoryModel.dart';

import '../../model/study_material/study_materil.dart';

class AllStudyMaterialForLIVEScreen extends StatelessWidget {
  var catData;
  var id;
  AllStudyMaterialForLIVEScreen(
      {required this.catData, required this.id, super.key});
  final getxController = Get.put(StudyMaterialController());

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      appBar: AppBar(
        title: Text("All Category"),
      ),
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("LiveCourselist")
                  .doc(id)
                  .collection("StudyMaterialsforlive")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AnimationLimiter(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      padding: EdgeInsets.all(_w / 60),
                      crossAxisCount: columnCount,
                      children: List.generate(
                        snapshot.data!.docs.length,
                        (int index) {
                          final data = StudyMaterialModel.fromJson(
                              snapshot.data!.docs[index].data());
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 200),
                            columnCount: columnCount,
                            child: ScaleAnimation(
                              duration: const Duration(milliseconds: 900),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Message'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: const <Widget>[
                                                Text('Do you want to Delete'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('cancel'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('ok'),
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        "LiveCourselist")
                                                    .doc(id)
                                                    .collection(
                                                        "StudyMaterialsforlive")
                                                    .doc(data.id)
                                                    .delete()
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: _w / 10,
                                        left: _w / 20,
                                        right: _w / 20),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(213, 161, 34, 34),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 40,
                                          spreadRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        data.subtitle,
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                }
              })),
    );
  }
}


// import this Package in pubspec.yaml file
// dependencies:
// 
// flutter_staggered_animations: 



