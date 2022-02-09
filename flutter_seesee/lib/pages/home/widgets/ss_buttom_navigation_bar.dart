import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_seesee/controller/main_page_controller.dart';
import 'package:flutter_seesee/events/stop_play_event.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/application.dart';
import 'package:get/get.dart';
///首页底部导航
class SSBottomNavigationBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SSBottomNavigationBarState();
  }
}

class _SSBottomNavigationBarState extends State<SSBottomNavigationBar>{

  //用来获取BottomBar的高度
  final GlobalKey bottomBarKey = GlobalKey();
  Widget _bottomBarLayout;
  final MainPageController mainPageController = Get.put(MainPageController());

  @override
  void initState() {
    super.initState();
    _bottomBarLayout = _getLayoutBottomBar();
    //BottomBar绘制完成时候的监听
    WidgetsBinding.instance.addPostFrameCallback((_bottomBarLayout) {
      double videoViewHeight = MediaQuery.of(context).size.height - bottomBarKey.currentContext.size.height - MediaQueryData.fromWindow(window).padding.top;
      mainPageController.setVideoViewHeight(videoViewHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _bottomBarLayout;
  }

  _getLayoutBottomBar(){
    return Container(
      key: bottomBarKey,
      color:Colors.black,
      height: 48,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: _getAnimatedText('home'.tr, 0)
          ),
          Expanded(
              flex: 1,
              child: _getAnimatedText('friend'.tr, 1)
          ),
          Expanded(
              flex: 1,
              child:InkWell(
                onTap: (){
                  Application.eventBus.fire(StopPlayEvent());
                },
                child: Container(
                  width: 20,
                  height: 25,
                  decoration: BoxDecoration(color: ColorManager.white, borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.add, color: Colors.black, size: 15),
                ),
              )
          ),
          Expanded(
              flex: 1,
              child:_getAnimatedText('message'.tr, 2)
          ),
          Expanded(
              flex: 1,
              child:_getAnimatedText('me'.tr, 3)
          ),
        ],
      ),
    );
  }

  _getAnimatedText(String barName,int index){
    return TextButton(
        onPressed: (){
          if(index != 0) {
            Application.eventBus.fire(StopPlayEvent());
          }
          mainPageController.selectIndexBottomBarMainPage(index);

        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),

        //配置如果选中了就显示白色，不然灰色，选中字体大1号。
        child:Obx(()=>  Text(barName,style: TextStyle(
            color: mainPageController.bottomPageIndex.value == index ? Colors.white:Colors.grey,
            fontSize: mainPageController.bottomPageIndex.value == index ? 16:15,
            fontWeight: FontWeight.bold
        ),),
        )
    );
  }

}