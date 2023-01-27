
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';



UserPaymentModel UserPaymentModelFromJson(String str) =>
    UserPaymentModel.fromJson(json.decode(str));

String UserPaymentModelToJson(UserPaymentModel data) =>
    json.encode(data.toJson());

class UserPaymentModel {
  UserPaymentModel({
    required this.useremail,
    required this.userName,
    required this.courseid,
    required this.uid,
    required this.id,
    required this.courseName,
    required this.totalprice,
    required this.randomNumber,
    required this.inVoiceNumber,
    required this.exDate,
    required this.duration,
  });
  String userName;

  String useremail;
  String courseid;
  String id;
  int inVoiceNumber;
  String uid;
  String courseName;
  String totalprice;
  String randomNumber;
  String exDate;
  String duration;

  factory UserPaymentModel.fromJson(Map<String, dynamic> json) =>
      UserPaymentModel(
          useremail: json["useremail"] ?? '',
          inVoiceNumber: json["inVoiceNumber"] ?? 0,
          id: json["id"] ?? '',
          userName: json["userName"] ?? '',
          courseid: json["courseid"] ?? '',
          uid: json["uid"] ?? '',
          courseName: json["courseName"] ?? '',
          totalprice: json["totalprice"],
          randomNumber: json["randomNumber"] ?? '',
          exDate: json["exDate"] ?? '',
          duration: json["duration"] ?? '');

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "userName": userName,
        "courseid": courseid,
        "uid": uid,
        "id": id,
        "courseName": courseName,
        "inVoiceNumber": inVoiceNumber,
        "totalprice": totalprice,
        "randomNumber": randomNumber,
        "exDate": exDate,
        "duration": duration,
      };
}

class ListofCourses {
  List<UserPaymentModel> listofCourse;
  ListofCourses({
    required this.listofCourse,
  });

  ListofCourses copyWith({
    List<UserPaymentModel>? listofCourse,
  }) {
    return ListofCourses(
      listofCourse: listofCourse ?? this.listofCourse,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listofCourse': listofCourse.map((x) => x.toJson()).toList(),
    };
  }

  factory ListofCourses.fromMap(Map<String, dynamic> map) {
    return ListofCourses(
      listofCourse: List<UserPaymentModel>.from(
        (map['listofCourse'] as List<dynamic>).map<UserPaymentModel>(
          (x) => UserPaymentModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListofCourses.fromJson(String source) =>
      ListofCourses.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListofCourses(listofCourse: $listofCourse)';

  @override
  bool operator ==(covariant ListofCourses other) {
    if (identical(this, other)) return true;

    return listEquals(other.listofCourse, listofCourse);
  }

  @override
  int get hashCode => listofCourse.hashCode;
}
