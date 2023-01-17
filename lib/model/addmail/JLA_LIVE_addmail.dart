//     final JLALiveEmailAddModel = JLALiveEmailAddModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../faculties/faculties_screen.dart';

JLALiveEmailAddModel JLALiveEmailAddModelFromJson(String str) =>
    JLALiveEmailAddModel.fromJson(json.decode(str));

String JLALiveEmailAddModelToJson(JLALiveEmailAddModel data) =>
    json.encode(data.toJson());

class JLALiveEmailAddModel {
  JLALiveEmailAddModel({
    required this.email,
  });

  String email;

  factory JLALiveEmailAddModel.fromJson(Map<String, dynamic> json) =>
      JLALiveEmailAddModel(
        email: json["email"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
      };
}

class JLALIVEEmailAddToFireBase {
  Future EmailController(JLALiveEmailAddModel productModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("JLALiveCourse").doc();

      doc.set(productModel.toJson()).then((value) => Navigator.pop(context));
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
