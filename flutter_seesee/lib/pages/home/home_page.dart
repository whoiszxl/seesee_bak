import 'package:flutter/material.dart';
import 'package:flutter_seesee/events/stop_play_event.dart';
import 'package:flutter_seesee/pages/home/follow_tab_page.dart';
import 'package:flutter_seesee/pages/home/recommend_tab_page.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
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

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, initialIndex: 1, child: _body());
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
              FollowTabPage(), RecommendTabPage(),
            ],
          ),
          Positioned(
            top: 45,
            child: Container(
              color: Colors.transparent,
              width: _size.width,
              height: 50,
              child: Row(
                children: [
                  //live icon
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      child: Icon(Icons.live_tv, size: 25, color: Colors.white.withOpacity(0.5)),
                      onTap: () {

                      },
                    )
                  ),

                  //tab 卡片
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 90, right: 90, top: 10, bottom: 15),
                        child: Center(
                          child: TabBar(
                            onTap: (index){
                              if(index == 0) {
                                Application.eventBus.fire(StopPlayEvent());
                              }
                            },
                            indicatorColor: ColorManager.white,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: ColorManager.white,
                            tabs: [
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

  @override
  bool get wantKeepAlive => true;
}