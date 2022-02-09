import 'package:flutter/material.dart';

///home页面
class MemberPage extends StatefulWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MemberPageState();
  }
}

class _MemberPageState extends State<MemberPage>{

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
    return const Center(child: Text("member"));
  }
}