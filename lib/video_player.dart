import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {


  late FlickManager flickManager;
  String url = "https://firebasestorage.googleapis.com/v0/b/science-pro-ee1a7.appspot.com/o/9xmenXfCMKWz8Pk9pBKEtzPn4d62%2F20220731_220456.mp4?alt=media&token=f9ffd61d-d942-44b9-8954-bb9ba6b58b49";
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(url),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
          flickManager: flickManager
      ),
    );
  }
}
