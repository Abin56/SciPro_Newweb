import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var studydropDownLIVEValue;

class StudyMaterialCourseForLIVEDropDownButton extends StatefulWidget {
  const StudyMaterialCourseForLIVEDropDownButton({Key? key}) : super(key: key);

  @override
  State<StudyMaterialCourseForLIVEDropDownButton> createState() =>
      _StudyMaterialCourseForLIVEDropDownButtonState();
}

class _StudyMaterialCourseForLIVEDropDownButtonState
    extends State<StudyMaterialCourseForLIVEDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return dropDownButton();
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> dropDownButton() {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("LiveCourselist").snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return DropdownButtonFormField(
              hint: studydropDownLIVEValue == null
                  ? const Text("select course")
                  : Text(studydropDownLIVEValue!["courseTitle"]),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              items: snapshot.data!.docs.map(
                (val) {
                  return DropdownMenuItem(
                    value: val["courseTitle"],
                    child: Text(val["courseTitle"]),
                  );
                },
              ).toList(),
              onChanged: (val) {
                var categoryIDObject = snapshot.data!.docs
                    .where((element) => element["courseTitle"] == val)
                    .toList()
                    .first;
                log(categoryIDObject["id"]);

                setState(
                  () {
                    studydropDownLIVEValue = categoryIDObject;
                  },
                );
              },
            );
          }
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
