//     final JSALivemailAddModel = JSALivemailAddModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../faculties/faculties_screen.dart';

JSALivemailAddModel JSALivemailAddModelFromJson(String str) =>
    JSALivemailAddModel.fromJson(json.decode(str));

String JSALivemailAddModelToJson(JSALivemailAddModel data) => json.encode(data.toJson());

class JSALivemailAddModel {
  JSALivemailAddModel({
    required this.email,
  });

  String email;

  factory JSALivemailAddModel.fromJson(Map<String, dynamic> json) => JSALivemailAddModel(
        email: json["email"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
      };
}

class JSALIVEEmailAddToFireBase {
  Future EmailController(JSALivemailAddModel productModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("JSALiveCourse").doc();

      doc.set(productModel.toJson()).then((value) => Navigator.pop(context));;
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
