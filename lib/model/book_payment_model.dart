//     final BookPaymentModel = BookPaymentModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../main_screens/home_screen.dart';

BookPaymentModel BookPaymentModelFromJson(String str) =>
    BookPaymentModel.fromJson(json.decode(str));

String BookPaymentModelToJson(BookPaymentModel data) =>
    json.encode(data.toJson());

class BookPaymentModel {
  BookPaymentModel({
    required this.userName,
    required this.useremail,
    required this.bookName,
    required this.bookedTime,
    required this.bookedDate,
    required this.address,
    required this.pinCode,
  });
  String userName;
  String useremail;
  String bookName;
  String bookedTime;
  String bookedDate;
  String address;
  String pinCode;

  factory BookPaymentModel.fromJson(Map<String, dynamic> json) =>
      BookPaymentModel(
        userName: json["userName"] ?? '',
        useremail: json["useremail"] ?? '',
        bookName: json["bookName"] ?? '',
        bookedTime: json["bookedTime"] ?? '',
        bookedDate: json["bookedDate"] ?? '',
        address: json["address"] ?? '',
        pinCode: json["pinCode"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "useremail": useremail,
        "bookName": bookName,
        "bookedTime": bookedTime,
        "bookedDate": bookedDate,
        "address": address,
        "pinCode": pinCode,
      };
}

class BookPaymentSucessAddToFireBase {
  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  Future BookPaymentSucessModelController(
    BookPaymentModel productModel,context
  ) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase
          .collection("BookPaymentModel_live")
          .doc(currentUser)
          .set(productModel.toJson())
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaymentSuccessFull()))
              );
    } on FirebaseException catch (e) {
      // log('Error ${e.message.toString()}');
    }
  }
}
// PaymentSuccessFull

class PaymentSuccessFull extends StatelessWidget {
  const PaymentSuccessFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homescreen(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child:
            LottieBuilder.asset('assets/images/116385-order-confirmation.json'),
      )),
    );
  }

  homescreen(context) async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return HomeScreen();
      },
    ));
  }
}
