//     final JSARecEmailAddModel = JSARecEmailAddModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../faculties/faculties_screen.dart';

JSARecEmailAddModel JSARecEmailAddModelFromJson(String str) =>
    JSARecEmailAddModel.fromJson(json.decode(str));

String JSARecEmailAddModelToJson(JSARecEmailAddModel data) =>
    json.encode(data.toJson());

class JSARecEmailAddModel {
  JSARecEmailAddModel({
    required this.email,
  });

  String email;

  factory JSARecEmailAddModel.fromJson(Map<String, dynamic> json) =>
      JSARecEmailAddModel(
        email: json["email"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
      };
}

class JSARECEmailAddToFireBase {
  Future EmailController(JSARecEmailAddModel productModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("JSARecordedCourse").doc();

      doc.set(productModel.toJson()).then((value) => Navigator.pop(context));;
    } on FirebaseException catch (e) {
      print('Error ${e.message.toString()}');
    }
  }
}
