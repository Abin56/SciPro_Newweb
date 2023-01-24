import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/getx/s_materials_getx.dart';

import '../getx/getx.dart';
import '../model/study_material/study_materil.dart';

class AllStudyMaterialScreen extends StatelessWidget {
  var catData;
  AllStudyMaterialScreen({required this.catData, super.key});
  final getxController = Get.put(StudyMaterialController());

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
        appBar: AppBar(
            title: const Text("Study Materials"),
            centerTitle: true,
            brightness: Brightness.dark),
        body: GetBuilder<StudyMaterialController>(
          init: getxController,
          initState: (_) {},
          builder: (_) {
            return getxController.list1.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : StreamBuilder(
                    stream: getxController.getProduct(catData),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<StudyMaterialModel>> snapshot) {
                      if (snapshot.hasData) {
                        return AnimationLimiter(
                          child: GridView.count(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.all(_w / 60),
                            crossAxisCount: columnCount,
                            children: List.generate(
                              snapshot.data!.length,
                              (int index) {
                                final data = snapshot.data![index];
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 200),
                                  columnCount: columnCount,
                                  child: ScaleAnimation(
                                    duration: const Duration(milliseconds: 900),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: FadeInAnimation(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: _w / 10,
                                            left: _w / 20,
                                            right: _w / 20),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 219, 168, 0),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 40,
                                              spreadRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              data.subject,
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              data.subtitle,
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          "StudyMaterials")
                                                      .doc(data.id)
                                                      .delete();
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 30,
                                                ))
                                          ],
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
                    });
          },
        ));
  }
}


// import this Package in pubspec.yaml file
// dependencies:
// 
// flutter_staggered_animations: 



