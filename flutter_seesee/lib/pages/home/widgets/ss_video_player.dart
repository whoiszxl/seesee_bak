import 'package:flutter/material.dart';
import 'package:flutter_seesee/events/stop_play_event.dart';
import 'package:flutter_seesee/router/application.dart';
import 'package:video_player/video_player.dart';

///视频播放器组件
class SSVideoPlayer extends StatefulWidget {

  //视频url
  final String videoUrl;

  const SSVideoPlayer({Key key, this.videoUrl}) : super(key: key);

  @override
  _SSVideoPlayerState createState() => _SSVideoPlayerState();
}

class _SSVideoPlayerState extends State<SSVideoPlayer> {

  VideoPlayerController _videoController;
  bool isShowPlaying = false;

  @override
  void dispose() {
    super.dispose();
    //_videoController.dispose();
  }

  @override
  void initState() {
    super.initState();

    //初始化视频控制器
    _videoController = VideoPlayerController.network(widget.videoUrl)..initialize().then((value) {
        _videoController.play();
        setState(() {
          isShowPlaying = false;
        });
        _videoController.play();
      })
      ..setLooping(true);

    //监听停止播放视频事件，做出对应处理
    Application.eventBus.on<StopPlayEvent>().listen((event) {
      isShowPlaying = false;
      _videoController.pause();
    });
  }

  //判断是否展示播放按钮
  Widget playingButton() {
    return _videoController.value.isPlaying && !isShowPlaying ? Container() : Icon(Icons.play_arrow, size: 80, color: Colors.white.withOpacity(0.5));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: InkWell(
          onTap: () {
            setState(() {
              _videoController.value.isPlaying ? _videoController.pause() : _videoController.play();
            });
          },
          child: Stack(
            children: [
              //视频播放器
              VideoPlayer(_videoController),

              //是否展示播放按钮
              Center(child: Container(decoration: const BoxDecoration(), child: playingButton()))
            ],
          ),
        ));
  }
}