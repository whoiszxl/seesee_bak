import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_seesee/controller/main_page_controller.dart';
import 'package:flutter_seesee/pages/city/city_page.dart';
import 'package:flutter_seesee/pages/home/home_page.dart';
import 'package:flutter_seesee/pages/home/widgets/ss_buttom_navigation_bar.dart';
import 'package:flutter_seesee/pages/member/member_page.dart';
import 'package:flutter_seesee/pages/message/message_page.dart';
import 'package:get/get.dart';

///主页面
class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{

  final MainPageController mainPageController = Get.put(MainPageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _body() {
    switch(mainPageController.bottomPageIndex.value) {
      case 0:
        return HomePage();
      case 1:
        return CityPage();
      case 2:
        return const MessagePage();
      case 3:
        return MemberPage();
    }
  }


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_bottomBarLayout) {
      //设置状态栏的颜色和图标模式
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));
    });

    return Scaffold(
      body: Obx(() => _body()),
      bottomNavigationBar: SSBottomNavigationBar(),
    );
  }
}