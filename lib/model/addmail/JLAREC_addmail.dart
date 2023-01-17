//     final JLARecEmailAddModel = JLARecEmailAddModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../faculties/faculties_screen.dart';

JLARecEmailAddModel JLARecEmailAddModelFromJson(String str) =>
    JLARecEmailAddModel.fromJson(json.decode(str));

String JLARecEmailAddModelToJson(JLARecEmailAddModel data) => json.encode(data.toJson());

class JLARecEmailAddModel {
  JLARecEmailAddModel({
    required this.email,
  });

  String email;

  factory JLARecEmailAddModel.fromJson(Map<String, dynamic> json) => JLARecEmailAddModel(
        email: json["email"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
      };
}

class JLARECEmailAddToFireBase {
  Future EmailController(JLARecEmailAddModel productModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("JLARecordedCourse").doc();

      doc.set(productModel.toJson()).then((value) => Navigator.pop(context));;
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
