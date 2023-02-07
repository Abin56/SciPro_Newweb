//     final RecordedCourseSubScribedUserModel = RecordedCourseSubScribedUserModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

RecordedCourseSubScribedUserModel RecordedCourseSubScribedUserModelFromJson(
        String str) =>
    RecordedCourseSubScribedUserModel.fromJson(json.decode(str));

String RecordedCourseSubScribedUserModelToJson(
        RecordedCourseSubScribedUserModel data) =>
    json.encode(data.toJson());

class RecordedCourseSubScribedUserModel {
  RecordedCourseSubScribedUserModel(
      {required this.useremail,
      required this.userName,
      required this.courseid,
      required this.uid,
      required this.courseName,
      required this.inVoiceNumber,
      required this.date,
      required this.time,
      required this.totalprice,
      required this.id,
      required this.joinDate});

  String userName;
  String courseid;
  String useremail;
  String uid;
  String courseName;
  dynamic inVoiceNumber;
  String date;
  String time;
  String totalprice;
  String id;
  String joinDate;

  factory RecordedCourseSubScribedUserModel.fromJson(
          Map<String, dynamic> json) =>
      RecordedCourseSubScribedUserModel(
        useremail: json["useremail"] ?? '',
        joinDate: json["joinDate"] ?? '',
        inVoiceNumber: json["inVoiceNumber"] ?? '',
        date: json["date"] ?? '',
        time: json["time"] ?? '',
        userName: json["userName"] ?? '',
        courseid: json["courseid"] ?? '',
        uid: json["uid"] ?? '',
        courseName: json["courseName"] ?? '',
        totalprice: json["totalprice"] ?? '',
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "inVoiceNumber": inVoiceNumber,
        "courseName": courseName,
        "date": date,
        "userName": userName,
        "courseid": courseid,
        "uid": uid,
        "time": time,
        "joinDate": joinDate,
        "totalprice": totalprice,
        "id": id,
      };
}







// class LivePaymentStatusAddToFireBase {
//   final currentUser = FirebaseAuth.instance.currentUser!.uid;
//   Future livePaymentModelController(
//       RecordedCourseSubScribedUserModel productModel, String randomNumner) async {
//     try {
//       final firebase = FirebaseFirestore.instance;
//       final doc = firebase
//           .collection("RecordedCourseSubScribedUserModel_live")
//           .doc(currentUser)
//           .set(productModel.toJson())
//           .then((value) => Get.to(HomeScreen()));
//     } on FirebaseException catch (e) {
//       // log('Error ${e.message.toString()}');
//     }
//   }
// }
