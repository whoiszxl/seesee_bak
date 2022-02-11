import 'package:flutter/material.dart';
import 'package:flutter_seesee/res/colors_manager.dart';

///home页面
class FollowTabPage extends StatefulWidget {

  const FollowTabPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FollowTabPageState();
  }
}

class _FollowTabPageState extends State<FollowTabPage>{

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
    return Container(color: ColorManager.main);
  }
}