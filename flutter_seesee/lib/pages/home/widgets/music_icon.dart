import 'package:flutter/material.dart';
import 'package:flutter_seesee/res/colors_manager.dart';

///music CD组件
class MusicIcon extends StatefulWidget {
  final String musicImgUrl;

  const MusicIcon(this.musicImgUrl, {Key key}) : super(key: key);

  @override
  _MusicIconState createState() => _MusicIconState();
}

class _MusicIconState extends State<MusicIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  RotationTransition animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.forward(from: 0.0);
            }
          }),
        child: _musicIcon());

    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: animation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _musicIcon() {
    return SizedBox(
        height: 38,
        width: 38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(height: 38, width: 38, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black54)),
                Positioned(
                  top: 8,
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.yellow,
                        image: DecorationImage(image: NetworkImage(widget.musicImgUrl))
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}