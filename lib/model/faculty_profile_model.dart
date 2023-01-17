//     final FaculityProfileModel = FaculityProfileModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../faculties/faculties_screen.dart';

FaculityProfileModel FaculityProfileModelFromJson(String str) =>
    FaculityProfileModel.fromJson(json.decode(str));

String FaculityProfileModelToJson(FaculityProfileModel data) =>
    json.encode(data.toJson());

class FaculityProfileModel {
  FaculityProfileModel({
    required this.facultyemail,
    required this.facultyName,
    required this.facultyid,
    required this.id,
    required this.facultyPassword,
  });

  String facultyName;
  String facultyid;
  String facultyemail;
  String id;
  String facultyPassword;

  factory FaculityProfileModel.fromJson(Map<String, dynamic> json) =>
      FaculityProfileModel(
        facultyemail: json["facultyemail"] ?? '',
        facultyName: json["facultyName"] ?? '',
        facultyid: json["facultyid"] ?? '',
        id: json["id"] ?? '',
        facultyPassword: json["facultyPassword"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "facultyemail": facultyemail,
        "facultyName": facultyName,
        "facultyid": facultyid,
        "id": id,
        "facultyPassword": facultyPassword,
      };
}

class FacultyProfileToFireBase {
  Future facultyProfileController(FaculityProfileModel productModel,context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("FacultyProfiles").doc();
      productModel.id = doc.id;

      doc
          .set(productModel.toJson())
          .then((value) => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return FacultyScreen(id: doc.id);
                },
              )));
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
