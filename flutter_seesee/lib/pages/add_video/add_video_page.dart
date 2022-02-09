import 'package:flutter/material.dart';

///home页面
class AddVideoPage extends StatefulWidget {
  const AddVideoPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddVideoPageState();
  }
}

class _AddVideoPageState extends State<AddVideoPage>{

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