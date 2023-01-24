//     final StudyMateriCategoryModel = StudyMateriCategoryModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

StudyMateriCategoryModel StudyMateriCategoryModelFromJson(String str) =>
    StudyMateriCategoryModel.fromJson(json.decode(str));

String StudyMateriCategoryModelToJson(StudyMateriCategoryModel data) =>
    json.encode(data.toJson());

class StudyMateriCategoryModel {
  StudyMateriCategoryModel({
    required this.id,
    required this.courseTitle,
  });

  String id;

  String courseTitle;

  factory StudyMateriCategoryModel.fromJson(Map<String, dynamic> json) =>
      StudyMateriCategoryModel(
        id: json["id"] ?? '',
        courseTitle: json["courseTitle"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courseTitle": courseTitle,
        
      };
}

class StudyMaterialCategoryToFireBase {
  Future studyMaterialCategoryController(
      StudyMateriCategoryModel studymateriCategoryModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("CategoryS_Material").doc();
      studymateriCategoryModel.id = doc.id;

      doc.set(studymateriCategoryModel.toJson()).then((value) {
        // isWorking = false;
        return showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Message'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Successfully Uploaded to Server'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
      // .then((value) => Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return FacultyScreen(id: doc.id);
      //       },
      //     )));
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
