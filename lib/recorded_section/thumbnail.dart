// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lepton_sci_web/recorded_section/coure_dropdown.dart';
// import 'package:lepton_sci_web/recorded_section/uploadvideo.dart';
// import 'package:lepton_sci_web/utils/colors.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

// class UploadThumbnailImage extends StatefulWidget {
//   String? imapath;
//   UploadThumbnailImage({super.key});

//   @override
//   State<UploadThumbnailImage> createState() => _UploadThumbnailImageState();
// }

// class _UploadThumbnailImageState extends State<UploadThumbnailImage> {
//   double progress = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Upload Thumbail"),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Please Select Course",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const VideoCourseDropDownButton(),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextButton(
//                 onPressed: () async {
//                   FilePickerResult? result =
//                       await FilePicker.platform.pickFiles();
//                   if (result != null) {
//                     Uint8List? file = result.files.first.bytes;
//                     String filename = result.files.first.name;
//                     UploadTask task = FirebaseStorage.instance
//                         .ref()
//                         .child("files/images$filename")
//                         .putData(file!);
//                     task.snapshotEvents.listen((event) {
//                       setState(() {
//                         progress = ((event.bytesTransferred.toDouble() /
//                                     event.totalBytes.toDouble()) *
//                                 100)
//                             .roundToDouble();
//                         if (progress == 100) {
//                           event.ref.getDownloadURL().then((thumbnailUrl) {
//                             setState(() {
//                               widget.imapath = thumbnailUrl;
//                             });
//                           }

//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //     builder: (context) {
//                               //       return UploadVideo(
//                               //           drovalueId: dropDownValue!["id"],
//                               //           thumbnail: thumbnailUrl);
//                               //     },
//                               //   ),
//                               // ),
//                               );
//                         }
//                       });
//                     });
//                   }
//                 },
//                 child: const Text(
//                   "Click here this button for Upload Thumbanail",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(widget.imapath ??
//                     'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg'),
//               ),
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return UploadVideo(
//                               drovalueId: dropDownValue!["id"],
//                               thumbnail: widget.imapath);
//                         },
//                       ),
//                     );
//                   },
//                   child: Text("sdvhfvhdf")),
//               const SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 height: 200.0,
//                 width: 200.0,
//                 child: LiquidCircularProgressIndicator(
//                   value: progress / 100,
//                   valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
//                   backgroundColor: Colors.white,
//                   direction: Axis.vertical,
//                   center: Text(
//                     "$progress%",
//                     style: GoogleFonts.poppins(
//                         color: Colors.black87, fontSize: 25.0),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
