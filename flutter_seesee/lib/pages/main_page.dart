import 'package:flutter/material.dart';

///主页面
class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{

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
    return  Scaffold(
      body: Stack(
          children: const [
            Text("main")
          ]
      ),
    );
  }
}