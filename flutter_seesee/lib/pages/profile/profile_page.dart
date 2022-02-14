import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/member_page_controller.dart';
import 'package:flutter_seesee/controller/profile_page_controller.dart';
import 'package:flutter_seesee/entity/response/profile_member_info_response.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/pages/profile/widgets/profile_header.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:flutter_seesee/widgets/ss_navigation_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///会员页面
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin {


  var memberPadding = const EdgeInsets.only(top: 8, left: 5, right: 5);

  final MemberPageController memberPageController = Get.put(MemberPageController());
  final ProfilePageController profilePageController = Get.put(ProfilePageController());

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();

  String memberId;

  @override
  void initState() {
    super.initState();
    Map<String, String> getParams = Get.parameters;
    memberId = getParams['memberId'];
    memberPageController.memberDetailById(memberId);
    profilePageController.timeline(memberId);
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      if(memberPageController.memberProfile.value == null || memberPageController.memberProfile.value.memberId == null) {
        return const Center(child: Text("加载中"));
      }else {
        return Scaffold(
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
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
              noDataText: "没有更多商品了",
            ),
            controller: _refreshController,
            child: _son(memberPageController.memberProfile.value)
          ),
        );
      }
    });
  }


  _son(ProfileMemberInfoResponse profileMemberInfoResponse) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              //会员信息头部
              ProfileHeader(memberInfo: profileMemberInfoResponse),
              SSNavigationBar(
                height: 30,
                color: Colors.transparent,
                statusStyle: StatusStyle.DARK_CONTENT,
                child: profileAppBar(context),
              ),
            ],
          ),

          const SizedBox(height: 2),


          StaggeredGridView.countBuilder(
            controller: scrollController,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 2, left: 2, right: 2),
            crossAxisCount: 3,
            itemCount: profilePageController.myVideoList.length,
            itemBuilder: (BuildContext context, int index) {
              return _videoCard(profilePageController.myVideoList[index]);
            },

            staggeredTileBuilder: (int index) {
              return const StaggeredTile.fit(1);
            },
          )
        ],
      ),
    );
  }

  _videoCard(VideoEntity videoEntity) {
    return Container(
      height: 160,
      decoration: BoxDecoration(color: Colors.black26, border: Border.all(color: Colors.white70, width: .5)),
      child: FittedBox(
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: videoEntity.cover,
          placeholder: (context, url) => const Padding(
            padding: EdgeInsets.all(35.0),
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  void _onRefresh() async{
    memberPageController.memberInfo();
    profilePageController.refreshTimeline(memberId);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    profilePageController.timeline(memberId);
    _refreshController.loadComplete();

  }

  cardRadius() {
    return const BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
    );
  }

  ///profile页面appbar
  profileAppBar(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          //返回按钮
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              child: const Icon(Icons.arrow_back,color: ColorManager.grey),
              onTap: () {
                Get.back();
              },
            ),
          ),

          //跳转到设置界面
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              child: const Icon(Icons.settings_outlined,color: ColorManager.grey),
              onTap: () {
                Get.toNamed(Routers.settings);
              },
            ),
          ),
        ],
      ),
    );


  }

  @override
  bool get wantKeepAlive => true;
}