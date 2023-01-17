// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:lepton_sci_web/recorded_section/coure_dropdown.dart';
// import 'package:lepton_sci_web/recorded_section/thumbnail.dart';
// import 'package:lepton_sci_web/widgets/button_container.dart';

// class SelectCourseRec extends StatelessWidget {
//   const SelectCourseRec({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const VideoCourseDropDownButton(),
//           const SizedBox(
//             height: 30,
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) {
//                   return  UploadThumbnailImage();
//                 },
//               ));
//             },
//             child: ButtonContainerWidget(
//                 colorindex: 0,
//                 curving: 30,
//                 height: 60,
//                 width: 200,
//                 child: const Center(
//                   child:  Text(
//                     "Continue",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15),
//                   ),
//                 )),
//           )
//         ],
//       )),
//     );
//   }
// }
