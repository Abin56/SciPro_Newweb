//     final AddADSBookModel = AddADSBookModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AddADSBookModel AddADSBookModelFromJson(String str) =>
    AddADSBookModel.fromJson(json.decode(str));

String AddADSBookModelToJson(AddADSBookModel data) =>
    json.encode(data.toJson());

class AddADSBookModel {
  AddADSBookModel({
    required this.id,
    required this.bookImage,
    required this.discripition,
    required this.bookPrice,
    required this.nameofthebook,
    required this.onpress,
  });

  String id;
  String bookImage;
  String discripition;
  String bookPrice;
  String nameofthebook;
  bool onpress = false;

  factory AddADSBookModel.fromJson(Map<String, dynamic> json) =>
      AddADSBookModel(
        id: json["id"] ?? '',
        bookImage: json["bookImage"] ?? '',
        discripition: json["discripition"] ?? "",
        bookPrice: json["bookPrice"] ?? "",
        nameofthebook: json["nameofthebook"] ?? "",
        onpress: json["onpress"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookImage": bookImage,
        "discripition": discripition,
        "bookPrice": bookPrice,
        "nameofthebook": nameofthebook,
        "onpress": onpress,
      };
}

class ADSBookAddToFireBase {
  Future aDSBookAddModelController(
      AddADSBookModel productModel, context) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("ADS_Bookes").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson()).then((value) {
        // isWorking = false;
        return showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Message'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Successfully Uploaded to Server'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
      // .then((value) => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => CheckOutScreen(
      //             totalPrice: productModel.bookPrice,

      //             id: productModel.id,
      //             bookImage: productModel.bookImage,
      //             uid: productModel.uid,
      //             discripition: productModel.discripition,
      //             customername: productModel.userName,
      //             userAddress: productModel.userAddress,
      //             pinCode: productModel.pinCode))));
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}
