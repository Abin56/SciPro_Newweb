//     final UserRegModel = UserRegModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

UserRegModel UserRegModelFromJson(String str) =>
    UserRegModel.fromJson(json.decode(str));

String UserRegModelToJson(UserRegModel data) => json.encode(data.toJson());

class UserRegModel {
  UserRegModel({
    required this.useremail,
    required this.userName,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.pincode,
    required this.joinDate,
    required this.id,
  });

  String userName;
  String address;
  String useremail;
  String email;
  String id;
  String phoneNumber;
  dynamic pincode;
  String joinDate;

  factory UserRegModel.fromJson(Map<String, dynamic> json) => UserRegModel(
        useremail: json["useremail"] ?? '',
        pincode: json["pincode"] ?? '',
        joinDate: json["joinDate"] ?? '',
        userName: json["userName"] ?? '',
        address: json["address"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "pincode": pincode,
        "phoneNumber": phoneNumber,
        "joinDate": joinDate,
        "userName": userName,
        "address": address,
        "email": email,
        "id": id,
      };
}

// class UserRegModelAddToFireBase {
//   Future userRegModelController(UserRegModel productModel) async {
//     try {
//       final firebase = FirebaseFirestore.instance;
//       final doc = firebase.collection("AppLoginUsers").doc();
//       productModel.id = doc.id;

//       doc
//           .set(productModel.toJson())
//           .then((value) => Get.offAll(StudentandFacultyLoginScreen()));
//     } on FirebaseException catch (e) {
//       print('Error ${e.message.toString()}');
//     }
//   }
// }
