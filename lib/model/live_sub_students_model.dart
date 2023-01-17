//     final LiveCoursePaymentModel = LiveCoursePaymentModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

   LiveCoursePaymentModelFromJson(String str) =>
    LiveCoursePaymentModel.fromJson(json.decode(str));

String LiveCoursePaymentModelToJson(LiveCoursePaymentModel data) =>
    json.encode(data.toJson());

class LiveCoursePaymentModel {
  LiveCoursePaymentModel({
    required this.useremail,
    required this.userName,
    required this.courseid,
    required this.uid,
    required this.courseName,
  });

  String useremail;
  String userName;
  String courseid;
  String uid;
  String courseName;

  factory LiveCoursePaymentModel.fromJson(Map<String, dynamic> json) =>
      LiveCoursePaymentModel(
        useremail: json["useremail"] ?? '',
        userName: json["userName"] ?? '',
        courseid: json["courseid"] ?? '',
        uid: json["uid"] ?? '',
        courseName: json["courseName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "userName": userName,
        "courseid": courseid,
        "uid": uid,
        "courseName": courseName,
      };
}

// class LivePaymentStatusAddToFireBase {
//   final currentUser = FirebaseAuth.instance.currentUser!.uid;
//   Future livePaymentModelController(
//       LiveCoursePaymentModel productModel, String randomNumner) async {
//     try {
//       final firebase = FirebaseFirestore.instance;
//       final doc = firebase
//           .collection("LiveCoursePaymentModel_live")
//           .doc(currentUser)
//           .set(productModel.toJson())
//           .then((value) => Get.to(HomeScreen()));
//     } on FirebaseException catch (e) {
//       // log('Error ${e.message.toString()}');
//     }
//   }
// }
