import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../student_screens/create_student_profile.dart';
import '../student_screens/student_home.dart';

class FireStoreDataBase {
  String? downloadURL;

  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    downloadURL = await FirebaseStorage.instance.ref()
        .child("$userId")
    .child("fevicon.png")
        .getDownloadURL();
    debugPrint(downloadURL.toString());
    print(filename);
  }
}