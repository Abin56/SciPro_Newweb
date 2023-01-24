import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lepton_sci_web/model/study_material/study_materil.dart';
import 'package:lepton_sci_web/model/video_fecting_model.dart';

import '../model/video_model.dart';

class StudyMaterialController extends GetxController {
  List<Map<String, dynamic>> list1 = [];
  List<Map<String, dynamic>> categoryCollections = [];
  // var list = <DBStudentList>[].obs;
  String? pickedImage;

  Stream<List<StudyMaterialModel>> getProduct(String type) {
    log(">>>>>>>>iddddddddddddddddddddddddd${type}");
    String catData = '';
    for (Map<String, dynamic> map in categoryCollections) {
      if (map["courseTitle"] == type) {
        catData = map["id"];
      }
    }
    final data = FirebaseFirestore.instance
        .collection("StudyMaterials")
        .where('category', isEqualTo: catData)
        .snapshots();
    final d = data.map((event) =>
        event.docs.map((e) => StudyMaterialModel.fromJson(e.data())).toList());
    log('lepton>>>>>>>>>>>>>>>...${d.toString()}');

    return d;
  }

  Future<List<Map<String, dynamic>>> fetchingCategory() async {
    List<Map<String, dynamic>> list = [];
    await FirebaseFirestore.instance
        .collection("CategoryS_Material")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        list.add(element.data());
      });
    });
    list1 = list;
    log(list.toString());

    categoryCollections = list;
    log(list.toString(), name: "calling");
    update();
    return list;
  }

  @override
  void onInit() {
    fetchingCategory();
    super.onInit();
  }
}
