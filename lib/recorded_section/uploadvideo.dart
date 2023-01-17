// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lepton_sci_web/model/video_model.dart';
// import 'package:lepton_sci_web/recorded_section/coure_dropdown.dart';
// import 'package:lepton_sci_web/widgets/button_container.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

// class UploadVideo extends StatefulWidget {
//   final obj = VideoUploadToFireBase();
//   var thumbnail;
//   var drovalueId;
//   UploadVideo({required this.thumbnail, required this.drovalueId, super.key});

//   @override
//   State<UploadVideo> createState() => _UploadVideoState();
// }

// class _UploadVideoState extends State<UploadVideo> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController videoNameController = TextEditingController();
//   double progress = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Upload Videos"),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 250,
//                 width: 800,
//                 decoration: BoxDecoration(
//                     image:
//                         DecorationImage(image: NetworkImage(widget.thumbnail))),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please fill the VideoName';
//                   }
//                 },
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 keyboardType: TextInputType.number,
//                 controller: videoNameController,
//                 style: const TextStyle(color: Colors.black),
//                 decoration: const InputDecoration(
//                   helperText: 'Enter video Name',
//                   helperStyle: TextStyle(color: Colors.black),
//                   isDense: true,
//                   filled: true,
//                   fillColor: Color.fromARGB(0, 16, 16, 16),
//                   hintText: 'Video Name',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   focusColor: Colors.white,
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.white,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),

//               // const VideoCourseDropDownButton(),
//               const SizedBox(
//                 height: 60,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   FilePickerResult? result =
//                       await FilePicker.platform.pickFiles();

//                   if (result != null) {
//                     Uint8List? file = result.files.first.bytes;
//                     String filename = result.files.first.name;
//                     UploadTask task = FirebaseStorage.instance
//                         .ref()
//                         .child("files/videos$filename")
//                         .putData(file!);
//                     task.snapshotEvents.listen((event) {
          
//                       setState(() {
                        
//                         progress = ((event.bytesTransferred.toDouble() /
//                                     event.totalBytes.toDouble()) *
//                                 100)
//                             .roundToDouble();
                            
//                       }
//                       );
//                       if (progress == 100 ) {
                        
//                         event.ref.getDownloadURL().then((videoUrl) async {
//                           final details = VideoUploadModel(
//                             videoImage: widget.thumbnail,
//                             course: widget.drovalueId,
//                             id: '',
//                             videoPath: videoUrl,
//                             videoName: videoNameController.text.trim(),
//                           );
//                           await widget.obj
//                               .videouploadModelController(details, context);
//                         });
//                       }
//                     });
//                   }
//                 },
//                 child: ButtonContainerWidget(
//                   curving: 30,
//                   colorindex: 0,
//                   height: 60,
//                   width: 200,
//                   child: const Center(
//                     child: Text(
//                       "Upload video",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               SizedBox(
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
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
