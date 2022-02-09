import 'package:flutter/material.dart';
import 'package:flutter_seesee/events/stop_play_event.dart';
import 'package:flutter_seesee/pages/home/city_tab_page.dart';
import 'package:flutter_seesee/pages/home/follow_tab_page.dart';
import 'package:flutter_seesee/pages/home/recommend_tab_page.dart';
import 'package:flutter_seesee/router/application.dart';
import 'package:get/get.dart';

///home页面
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, initialIndex: 2, child: _body());
  }

  Widget _body() {
    var _size = MediaQuery.of(context).size;
    return SizedBox(
      width: _size.width,
      child: Stack(
        children: [
          const TabBarView(
            children: [
              //城市tab，关注tab，推荐tab
              CityTabPage(), FollowTabPage(), RecommendTabPage(),
            ],
          ),
          Positioned(
            top: 2,
            child: SizedBox(
              width: _size.width,
              height: 50,
              child: Row(
                children: [
                  //live icon
                  Padding(padding: const EdgeInsets.only(left: 20), child: Icon(Icons.live_tv, size: 25, color: Colors.white.withOpacity(0.5)),),

                  //tab 卡片
                  Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 15),
                        child: Center(
                          child: TabBar(
                            onTap: (index){
                              Application.eventBus.fire(StopPlayEvent());
                            },
                            indicatorColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(text: 'city'.tr),
                              Tab(text: 'focus'.tr),
                              Tab(text: 'recommend'.tr),
                            ],
                          ),
                        )),
                  ),

                  //搜索 icon
                  Padding(padding: const EdgeInsets.only(right: 20), child: Icon(Icons.search, size: 25, color: Colors.white.withOpacity(0.5)),),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}