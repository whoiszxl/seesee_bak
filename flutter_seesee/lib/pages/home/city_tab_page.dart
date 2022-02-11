import 'package:flutter/material.dart';
import 'package:flutter_seesee/res/colors_manager.dart';

///home页面
class CityTabPage extends StatefulWidget {

  const CityTabPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CityTabPageState();
  }
}

class _CityTabPageState extends State<CityTabPage>{

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