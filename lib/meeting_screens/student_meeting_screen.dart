import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/jitsi_meet_methods.dart';
import '../widgets/journy_page_button.dart';



class StudentMeetingScreen extends StatelessWidget {
  StudentMeetingScreen({Key? key}) : super(key: key);
  // JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  creatNewMeeting() async {
    var random= Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);

  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video_call');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF49a9f8),
        elevation: 0,
        title: const Text('My Class Room'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child:
                JournyPageButton(
                  onPressed: () => joinMeeting(context),
                  text: 'Join Meeting',
                  icon: Icons.video_camera_back_outlined,)
                )
              ],)
            ,)
        ],
      ),
    );
  }
}


