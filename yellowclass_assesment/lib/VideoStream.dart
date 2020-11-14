import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yellowclass_assesment/camera.dart';
import 'package:flutter/services.dart';

class VideoStream extends StatefulWidget {
  VideoStream({this.category, this.title, this.link});
  final String category, title, link;

  @override
  _VideoStreamState createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  var _volume = 0.5;
  bool _isLoading = true;
  int _playbackTime = 0;
  bool _volumeBool = false;
  bool _cameraBool = false;
  var vright = 25.0;
  var vbottom = 50.0;
  VideoPlayerController _videoPlayerController;

  void _initPlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.link);
//    _videoPlayerController = VideoPlayerController.asset("asset/hand.mp4");
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _initPlayer();
//    print("$category$title");
    _videoPlayerController.addListener(() {
      setState(() {
        _isLoading = false;
        _playbackTime = _videoPlayerController.value.position.inSeconds;
        _volume = _videoPlayerController.value.volume;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _videoPlayerController.value.initialized
            ? _playerWidget()
            : Container(),
      ),
    );
  }

  Widget _playerWidget() {
    return Stack(
      children: [
        _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : VideoPlayer(_videoPlayerController),
        Positioned(
          left: 25,
          top: 25,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.KJpqGlrtKlMkxCmKFXdfyAHaFj%26pid%3DApi&f=1'),
                backgroundColor: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Text(
                    "${widget.title}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${widget.category}",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: 25,
            top: 25,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _cameraBool = !_cameraBool;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.videocam,
                      size: 35,
                      color: _cameraBool ? Colors.orangeAccent : Colors.white,
                    ),
                    Text(
                      "Webcam",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ))),
        Positioned(
          top: MediaQuery.of(context).size.height * 4.1 / 5,
          child: Row(
            children: [
              SizedBox(width: 10),
              GestureDetector(
                  child: Icon(
                    _videoPlayerController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.orangeAccent,
                    size: 26,
                  ),
                  onTap: () {
                    _videoPlayerController.value.isPlaying
                        ? _videoPlayerController.pause()
                        : _videoPlayerController.play();
                    setState(() {
                      if (_videoPlayerController.value.position.inSeconds ==
                          _videoPlayerController.value.duration.inSeconds) {
                        _videoPlayerController.seekTo(Duration(seconds: 0));
                        _cameraBool = true;
                      }
                    });
                  }),
              Container(
                width: MediaQuery.of(context).size.width * 4.5 / 5,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 1,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 8.0),
                  ),
                  child: Slider(
                    value: _playbackTime.toDouble(),
                    label: '$_playbackTime',
                    divisions: _videoPlayerController.value.duration.inSeconds,
                    activeColor: Colors.orangeAccent,
                    min: 0.0,
                    max: _videoPlayerController.value.duration.inSeconds
                        .toDouble(),
                    onChanged: (double newValue) {
                      _videoPlayerController
                          .seekTo(Duration(seconds: newValue.toInt()));
                      setState(() {
                        _playbackTime = newValue.round();
                      });
                    },
                  ),
                ),
              ),
              GestureDetector(
                child: Icon(
                  _videoPlayerController.value.volume != 0.0
                      ? Icons.volume_up
                      : Icons.volume_mute,
                  color: Colors.orangeAccent,
                ),
                onTap: () {
                  setState(() {
                    _volumeBool = true;
                  });
                },
                onDoubleTap: () {
                  _videoPlayerController.setVolume(0.0);
                },
              )
            ],
          ),
        ),
        _volumeBool == true
            ? Positioned(
                top: MediaQuery.of(context).size.height * 3.0 / 5,
                left: MediaQuery.of(context).size.width * 4.3 / 5,
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: new Matrix4.identity()
                    ..rotateZ(270 * 3.1415927 / 180),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 4.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 8.0),
                    ),
                    child: Slider(
                      value: _volume.toDouble(),
                      divisions: 100,
                      activeColor: Colors.orangeAccent,
                      min: 0.0,
                      max: 1.0,
                      onChanged: (double newValue) {
                        _videoPlayerController.setVolume(newValue);
                      },
                      onChangeEnd: (v) {
                        setState(() {
                          _volumeBool = false;
                        });
                      },
                    ),
                  ),
                ),
              )
            : Container(),
        _cameraBool == true
            ? Positioned(
                right: vright,
                bottom: vbottom,
                child: GestureDetector(
                  onHorizontalDragUpdate: (DragUpdateDetails dd) {
                    vbottom = 100 - dd.localPosition.dy;
                    vright = 100 - dd.localPosition.dx;
                    print(vright);
                    print(vbottom);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.35,
                      color: Colors.white,
                      child: CameraApp(),
                    ),
//              ),
                  ),
                ),
              )
            : Container(),
        Positioned(
          top: MediaQuery.of(context).size.height * 4.35 / 5,
          left: MediaQuery.of(context).size.width * 0.27 / 5,
          child: Text(
            "0.00",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 4.35 / 5,
          left: MediaQuery.of(context).size.width * 4.55 / 5,
          child: Text(
            "${_videoPlayerController.value.duration.inSeconds < 60 ? _videoPlayerController.value.duration.inSeconds / 100 : _videoPlayerController.value.duration.inSeconds / 60}",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
