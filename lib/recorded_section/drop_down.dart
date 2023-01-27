// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lepton_sci_web/model/reco_course_addModel.dart';
// import 'package:lepton_sci_web/recorded_section/thumbnail.dart';
// import 'package:lepton_sci_web/widgets/button_container.dart';

// class DropDownButton extends StatelessWidget {
//   const DropDownButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Select Course"),
//       ),
//       body: SafeArea(
//         child: StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection("RecordedCourselist")
//                 .snapshots(),
//             builder: (context, snapshots) {
//               if (snapshots.hasData) {
//                 return ListView.separated(
//                     itemBuilder: (context, index) {
//                       final data = RecordedCourseAddModel.fromJson(
//                           snapshots.data!.docs[index].data());
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(
//                             builder: (context) {
//                               return UploadThumbnailImage();
//                             },
//                           ));
//                         },
//                         child: ButtonContainerWidget(
//                           curving: 30,
//                           colorindex: 5,
//                           height: 100,
//                           width: double.infinity,
//                           child: Center(
//                             child: Text(
//                               data.courseTitle,
//                               style: GoogleFonts.montserrat(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return const SizedBox(
//                         height: 20,
//                       );
//                     },
//                     itemCount: 1);
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator.adaptive(),
//                 );
//               }
//             }),
//       ),
//     );
//   }
// }
