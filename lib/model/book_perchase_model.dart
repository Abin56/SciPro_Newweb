// //     final UserAddressModel = UserAddressModelFromJson(jsonString);

// // ignore_for_file: file_names

// import 'dart:convert';
// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:web_scipro/razor_pay.dart/check_out_screen.dart';

// UserAddressModel UserAddressModelFromJson(String str) =>
//     UserAddressModel.fromJson(json.decode(str));

// String UserAddressModelToJson(UserAddressModel data) =>
//     json.encode(data.toJson());

// class UserAddressModel {
//   UserAddressModel({
//     required this.id,
//     required this.uid,
//     required this.userName,
//     required this.phoneNumber,
//     required this.pinCode,
//     required this.userAddress,
//     required this.bookname,
//     required this.bookPrice,
//   });

//   String id;
//   String uid;
//   String userName;
//   String phoneNumber;
//   String pinCode;
//   String userAddress;
//   String bookname;
//   String bookPrice;

//   factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
//       UserAddressModel(
//         id: json["id"] ?? '',
//         uid: json["uid"] ?? '',
//         userName: json["userName"] ?? '',
//         phoneNumber: json["phoneNumber"] ?? '',
//         pinCode: json["pinCode"] ?? "",
//         userAddress: json["OfferpinCode"] ?? "",
//         bookname: json["bookname"] ?? "",
//         bookPrice: json["bookPrice"] ?? "",
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "uid": uid,
//         "userName": userName,
//         "phoneNumber": phoneNumber,
//         "pinCode": pinCode,
//         "OfferpinCode": userAddress,
//         "bookname": bookname,
//         "bookPrice": bookPrice,
//       };
// }

// class UserAddressAddToFireBase {
//   Future addUserAddressModelController(
//       UserAddressModel productModel, context) async {
//     try {
//       final firebase = FirebaseFirestore.instance;
//       final doc = firebase.collection("UserAddressModel").doc();
//       productModel.id = doc.id;

//       doc.set(productModel.toJson()).then((value) => Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => CheckOutScreen(
//                   totalPrice: productModel.bookPrice,
                 
//                   id: productModel.id,
//                   phoneNumber: productModel.phoneNumber,
//                   uid: productModel.uid,
//                   bookName: productModel.bookname,
//                   customername: productModel.userName,
//                   userAddress: productModel.userAddress,
//                   pinCode: productModel.pinCode))));
//     } on FirebaseException catch (e) {
//       log('Error ${e.message.toString()}');
//     }
//   }
// }
