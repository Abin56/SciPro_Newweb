import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/live_sub_students_model.dart';
import '../widgets/button_container.dart';

class SubLiveStudents extends StatelessWidget {
  const SubLiveStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscribed Students',
          style: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("LiveCoursePaymentModel_live")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 1000,
                    width: 500,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = LiveCoursePaymentModel.fromJson(
                              snapshot.data!.docs[index].data());
                          return GestureDetector(
                            onTap: () {},
                            child: ButtonContainerWidget(
                                curving: 30,
                                colorindex: 0,
                                height: 150,
                                width: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Name :',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            data.userName,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'email :',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            data.useremail,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'course :',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            data.courseName,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'BLOCK THIS STUDENT :',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await deleteLiveStudentCategory(
                                                  context: context,
                                                  uid: data.uid,
                                                  userName: data.userName);
                                            },
                                            child: ButtonContainerWidget(
                                              curving: 30,
                                              colorindex: 5,
                                              height: 30,
                                              width: 150,
                                              child: Center(
                                                child: Text(
                                                  'Remove',
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snapshot.data!.docs.length),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              }),
        ),
      ),
    );
    ;
  }

  Future<dynamic> deleteLiveStudentCategory(
      {required context, required uid, required userName}) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: const Text(
            "Are You Sure to remove this Student ?",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            TextButton(
                onPressed: () async {
                  FirebaseFirestore.instance
                      .collection("LiveCoursePaymentModel_live")
                      .doc(uid)
                      .delete()
                      .then((value) => Navigator.pop(context));
                },
                child: const Text("Ok")),
          ],
        );
      },
    );
  }
}
