//     final StudyMaterialForLIVEModel = StudyMaterialForLIVEModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

StudyMaterialForLIVEModel StudyMaterialForLIVEModelFromJson(String str) =>
    StudyMaterialForLIVEModel.fromJson(json.decode(str));

String StudyMaterialForLIVEModelToJson(StudyMaterialForLIVEModel data) =>
    json.encode(data.toJson());

class StudyMaterialForLIVEModel {
  StudyMaterialForLIVEModel({
    required this.id,
    required this.studymaterialFile,
    required this.subtitle,
    required this.category,
    required this.subject,
    required this.courseTitle,
  });

  String id;

  String studymaterialFile;

  String subtitle;
  String category;
  String subject;
  String courseTitle;

  factory StudyMaterialForLIVEModel.fromJson(Map<String, dynamic> json) =>
      StudyMaterialForLIVEModel(
        id: json["id"] ?? '',
        studymaterialFile: json["vcourseame"] ?? '',
        subtitle: json["subtitle"] ?? "",
        category: json["category"] ?? "",
        subject: json["subject"] ?? "",
        courseTitle: json["courseTitle"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "studymaterialFile": studymaterialFile,
        "subtitle": subtitle,
        "category": category,
        "subject": subject,
        "courseTitle": courseTitle,
      };
}

class StudyMaterialforLVIEToFireBase {
  Future studyMaterialforLIVEController(
      StudyMaterialForLIVEModel studymaterialForLIVEModel,
      context,
      var id) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("LiveCourselist")
          .doc(id)
          .collection("StudyMaterialsforlive")
          .doc();
      studymaterialForLIVEModel.id = doc.id;

      doc.set(studymaterialForLIVEModel.toJson()).then((value) {
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
