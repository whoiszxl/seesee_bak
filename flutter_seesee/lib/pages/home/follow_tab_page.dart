import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/follow_page_controller.dart';
import 'package:flutter_seesee/pages/home/widgets/follow_tab_video_card.dart';
import 'package:flutter_seesee/widgets/normal_loading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///follow页面
class FollowTabPage extends StatefulWidget {

  const FollowTabPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FollowTabPageState();
  }
}

class _FollowTabPageState extends State<FollowTabPage> with AutomaticKeepAliveClientMixin<FollowTabPage>{

  final PageController _pageController = PageController(keepPage: true);
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final FollowPageController _followPageController = Get.put(FollowPageController());

  Size size;
  //在tab切换时保持页面状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _followPageController.getRecommendVideoList(_refreshController);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _refreshController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SmartRefresher(
          scrollController: ScrollController(),
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: () {
            _followPageController.refreshRecommendVideoList(_refreshController);
          },
          onLoading: () {
            _followPageController.getRecommendVideoList(_refreshController);
          },
          header: const ClassicHeader(
            refreshingText: "刷新中",
            releaseText: "刷新中",
            completeText: "刷新完成",
          ),
          footer: const ClassicFooter(
            loadingText: "加载中",
            failedText: "加载失败",
            idleText: "加载中",
            canLoadingText: "加载中",
            noDataText: "没有更多视频了",
          ),
          controller: _refreshController,
          child: _buildFollowTab(context),
      ),
    );
  }

  _buildFollowTab(BuildContext context) {
    return Obx(() {
      if(_followPageController.recommendVideoList.isEmpty) {
        return normalLoading();
      }

      return Container(
        padding: const EdgeInsets.only(top: 95),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('http://zero-mall.oss-cn-shenzhen.aliyuncs.com/banner/bg2.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter
            )),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              StaggeredGridView.countBuilder(
                controller: ScrollController(),
                shrinkWrap: true,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics (),
                padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
                itemCount: _followPageController.recommendVideoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return FollowTabVideoCard(videoEntity:  _followPageController.recommendVideoList[index]);
                },

                staggeredTileBuilder: (int index) {
                  return StaggeredTile.count(2, index == 0 ? 2.5 : 3);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}