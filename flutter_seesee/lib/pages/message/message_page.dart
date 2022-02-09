import 'package:flutter/material.dart';

///home页面
class MessagePage extends StatefulWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage>{

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
    return const Center(child: Text("message"));
  }
}