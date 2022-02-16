import 'package:flutter/material.dart';

///home页面
class VideoAddPage extends StatefulWidget {
  const VideoAddPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VideoAddPageState();
  }
}

class _VideoAddPageState extends State<VideoAddPage>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("add_video"));
  }
}