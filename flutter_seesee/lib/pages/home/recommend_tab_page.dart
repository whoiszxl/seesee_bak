import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/home_page_controller.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/pages/home/widgets/video_card.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///home页面
class RecommendTabPage extends StatefulWidget {

  const RecommendTabPage({Key key}) : super(key: key);

  @override
  _RecommendTabPageState createState() => _RecommendTabPageState();
}

class _RecommendTabPageState extends State<RecommendTabPage> with AutomaticKeepAliveClientMixin<RecommendTabPage> {

  final PageController _pageController = PageController(keepPage: true);
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final HomePageController _homePageController = Get.put(HomePageController());

  int pageViewClearThreshold = 100;

  //在tab切换时保持页面视频的选中状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _homePageController.refreshRecommendVideoList(_refreshController);
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: RotatedBox(
        quarterTurns: 1,
        child: SmartRefresher(
          controller: _refreshController,
          enablePullUp: true,
          onRefresh: () {},
          onLoading: () { _homePageController.getRecommendVideoList(_refreshController); },
          child: _getVideoList(context),
        ),
      ),
    );
  }

  ///获取视频列表组件，接口无数据返回空页面，有数据返回PageView组件
  _getVideoList(BuildContext context) {
    return Obx(() {
      List<VideoEntity> recommendVideoList = _homePageController.recommendVideoList;
      if(recommendVideoList == null || recommendVideoList.isEmpty) {
        return Container(color: ColorManager.main);
      }else {
        return PageView.builder(
          controller: _pageController,
          itemCount: recommendVideoList.length, //item视频数量
          scrollDirection: Axis.horizontal, //垂直滑动
          itemBuilder: (context, index) {
            return VideoCard(videoEntity: recommendVideoList[index]);
          },
          onPageChanged: (index){
            //在划动到倒数第二条的时候开始网络加载新的条目
            if(index >= recommendVideoList.length - 2) {
              _homePageController.getRecommendVideoList(_refreshController);
            }

            if(index == pageViewClearThreshold) {
              _homePageController.clearOldPageView(pageViewClearThreshold, _refreshController);
            }
          },
        );
      }
    });
  }

}