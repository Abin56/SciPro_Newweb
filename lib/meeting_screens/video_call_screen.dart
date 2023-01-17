// //import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:jitsi_meet/jitsi_meet.dart';

// import '../services/auth_methods.dart';
// import '../services/jitsi_meet_methods.dart';
// import '../widgets/meeting_options.dart';


// class VideoCallScreen extends StatefulWidget {
//   const VideoCallScreen({Key? key}) : super(key: key);

//   @override
//   _VideoCallScreenState createState() => _VideoCallScreenState();
// }

// class _VideoCallScreenState extends State<VideoCallScreen> {
//   final AuthMethods _authMethods = AuthMethods();
//   late TextEditingController meetingIdController;
//   //late TextEditingController nameController;
//   final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

//   String title = "loading";


//   void getData() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance.collection("LiveCourses").doc(
//         user!.uid ).get();
//     setState(() {
//       title= vari.data()!['Title'];
//     });
//   }




//   bool isAudioMuted = true;
//   bool isVideoMuted = true;

//   @override
//   void initState() {
//     meetingIdController = TextEditingController();
//     //nameController = TextEditingController(text: _authMethods.user.displayName);
//     getData();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     meetingIdController.dispose();
//     //nameController.dispose();
//     JitsiMeet.removeAllListeners()(title);
//   }

//   _joinMeeting() {
//     _jitsiMeetMethods.createMeeting(
//         roomName: meetingIdController.text ,
//         isAudioMuted: isAudioMuted,
//         isVideoMuted: isVideoMuted,
//         username: title

//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color(0xFF49a9f8),
//         title: const Text(
//           'Join a Meeting',
//           style: TextStyle(fontSize: 18,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//               height: 60,
//               child: TextField(
//                 controller: meetingIdController,
//                 maxLines: 1,
//                 textAlign: TextAlign.center,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                     fillColor: Colors.red,
//                     filled: true,
//                     border: InputBorder.none,
//                     hintText: 'Enter Room ID',
//                     contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
//                 ),
//               )
//           ),
//           SizedBox(
//               height: 60,
//               child: TextField(
//                // controller: nameController,
//                 maxLines: 1,
//                 textAlign: TextAlign.center,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                     fillColor: Colors.red,
//                     filled: true,
//                     border: InputBorder.none,
//                     hintText: 'Name',
//                     contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
//                 ),
//               )
//           ),
//           SizedBox(height: 20,),
//           InkWell(
//             onTap: _joinMeeting,
//             child: const Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Text(
//                   'Join',
//                   style: TextStyle(fontSize: 16, color: Colors.red),)
//             ),
//           ),
//           SizedBox(height: 20,),
//           MeetingOptions(
//             text: 'Mute Audio',
//             isMute: isAudioMuted,
//             onChange: onAudioMuted,),
//           MeetingOptions(
//             text: 'Turn off My Video',
//             isMute: isVideoMuted,
//             onChange: onVideoMuted,)

//         ],
//       ),
//     );
//   }
//   onAudioMuted(bool val) {
//     setState(() {
//       isAudioMuted = val;
//     });

//   }
//   onVideoMuted(bool val) {
//     setState(() {
//       isVideoMuted = val;
//     });

//   }

// }

