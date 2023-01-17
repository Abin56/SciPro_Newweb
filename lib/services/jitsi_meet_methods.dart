
// import 'package:jitsi_meet/feature_flag/feature_flag.dart';
// import 'package:jitsi_meet/jitsi_meet.dart';

// import 'auth_methods.dart';
// import 'firestore_methods.dart';

// class JitsiMeetMethods {
//   final AuthMethods _authMethods = AuthMethods();
//   final FirestoreMethods _firestoreMethods = FirestoreMethods();
//   final String _url = "https://test.scipro.in/";

//   void createMeeting({
//     required String roomName,
//     required bool isAudioMuted,
//     required bool isVideoMuted,
//     String username = '',
//   }) async {
//     try {
//       FeatureFlag featureFlag = FeatureFlag();
//       featureFlag.recordingEnabled = true;
//       featureFlag.welcomePageEnabled = true;
//       featureFlag.resolution = FeatureFlagVideoResolution
//           .MD_RESOLUTION; // Limit video resolution to 360p
//       String name;
//       if (username.isEmpty) {
//         name = _authMethods.user.displayName!;
//       } else {
//         name = username;
//       }
//       var options = JitsiMeetingOptions(room: roomName)
//         ..userDisplayName = name
//         ..serverURL = _url
//         ..userEmail = _authMethods.user.email
//         ..userAvatarURL = _authMethods.user.photoURL
//         ..audioMuted = isAudioMuted
//         ..videoMuted = isVideoMuted
//         ..webOptions = {
//           "roomName": roomName,
//           "width": "100%",
//           "height": "100%",
//           "enableWelcomePage": true,
//           "chromeExtensionBanner": true,
//           // "interfaceConfigOverwrite": {
//           //   "DEFAULT_BACKGROUND": '#000000',
//           // },
//           "userInfo": {"displayName": name}
//         };

//       _firestoreMethods.addToMeetingHistory(roomName);
//       await JitsiMeet.joinMeeting(options);
//     } catch (error) {
//       print("error: $error");
//     }
//   }
// }
