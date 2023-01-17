
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'landscpae_playe_page.dart';
import 'model_classes/video_model.dart';

class VideoPlayerFinal extends StatefulWidget {
  const VideoPlayerFinal({Key? key}) : super(key: key);

  @override
  State<VideoPlayerFinal> createState() => _VideoPlayerFinalState();
}

class _VideoPlayerFinalState extends State<VideoPlayerFinal> {
  late VideoPlayerController _controller;
  int _currentIndex = 0;

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= videos.length)
      return;

    if (!init) {
      _controller.pause();
    }

    setState(() => _currentIndex = index);


    _controller = VideoPlayerController.network(videos[_currentIndex].url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _controller.play());
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds
    ].join(':');
  }



  @override
  void initState() {
    super.initState();
    _playVideo(init: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SciPRO Video Player'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Container(
                color: Colors.black45,
                height: 350,
                child: _controller.value.isInitialized
                    ?Column(
                  children: <Widget>[
                    Stack(
                        children:
                        [
                          SizedBox(
                            height: 250 ,
                            child: VideoPlayer(_controller),),
                          Positioned(
                              bottom:0,
                              right:0,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder:
                                          (context) => LandscapePlayerPage(controller: _controller)),
                                    );
                                  },
                                  icon: const  Icon(
                                    Icons.fullscreen,
                                    color: Colors.white,
                                    size: 40,

                                  )))
                        ]),
                    const SizedBox(height: 12,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: _controller,
                            builder: (
                                context, VideoPlayerValue value, child) {
                              return Text(
                                _videoDuration(value.position),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                              );
                            }
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 10,
                            child: VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          _videoDuration(_controller.value.duration),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        )
                      ],
                    ),
                    IconButton(onPressed: () => _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play(),
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  ],
                )
                    :Center(
                    child: CircularProgressIndicator(color: Colors.white,))
            ),
            Expanded(child:
            Container(
              margin: EdgeInsets.symmetric(horizontal: 600),
              child: ListView.builder(
                  itemCount:videos.length,
                  itemBuilder: (context, index) {
                    return
                      InkWell(
                          onTap: () => _playVideo(index: index),
                          child:
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                SizedBox(
                                    height:150,
                                    width: 150,
                                    child:
                                    Image.network(
                                      videos[index].thumbnail,
                                      fit: BoxFit.contain,
                                    )
                                )
                              ],
                            ),
                          )
                      );
                  }

              ),
            ))
          ],
        )

    );
  }
}
