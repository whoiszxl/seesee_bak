import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/member_page_controller.dart';
import 'package:flutter_seesee/pages/member/widgets/member_right_menu_widget.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:flutter_seesee/router/sp_keys.dart';
import 'package:flutter_seesee/utils/sp_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

///我的页面
class MemberPage extends StatefulWidget {

  PageController pageController;

  MemberPage({Key key, PageController pageController}) : super(key: key) {
    pageController = pageController;
  }

  @override
  State<StatefulWidget> createState() {
    return _MemberPageState();
  }
}

class _MemberPageState extends State<MemberPage> {

  final MemberPageController _memberController = Get.find<MemberPageController>();

  @override
  void initState() {
    super.initState();

    //用户登录校验
    SPUtil.getString(SPKeys.token).then((token){
      if(GetUtils.isNullOrBlank(token)){
        Get.toNamed(Routers.login);
      }
    });

    //获取用户信息
    _memberController.getMemberInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Obx(() {
          if(_memberController.memberInfo.value == null || _memberController.memberInfo.value.username == null) {
            return const Center(child: Text("加载中"));
          }
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title组件
                  _headerTitle(),
                  const SizedBox(height: 15),

                  //头像组件
                  _headerAvatar(),
                  const SizedBox(height: 10),

                  //昵称
                  _headerNickname(),
                  const SizedBox(height: 2),

                  //关注数，粉丝数，点赞数
                  _countTab(),
                  const SizedBox(height: 15),

                  //编辑资料按钮
                  _editInfoButton(),
                  const SizedBox(height: 25),

                  //tab切换栏
                  _tabs(),

                  //我的视频列表
                  StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
                    crossAxisCount: 3,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return _videoCard("https://media.giphy.com/media/Ii4Cv63yG9iYawDtKC/giphy.gif");
                    },

                    staggeredTileBuilder: (int index) {
                      return const StaggeredTile.fit(1);
                    },
                  )

                ],
              )
          );
        }),
        Obx(() => DrawerController(
          child: const MemberRightMenuWidget(),
          alignment: DrawerAlignment.end,
          isDrawerOpen: _memberController.showRightMenu.value,
          drawerCallback: (isOpen) {
            _memberController.toggleRightMenu();
          },
        ))
      ],
    );
  }

  _videoCard(String coverUrl) {
    return Container(
      height: 140,
      decoration: BoxDecoration(color: Colors.black26, border: Border.all(color: Colors.white70, width: .5)),
      child: FittedBox(
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: coverUrl,
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

  _editInfoButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 140,
          height: 47,
          decoration: BoxDecoration(border: Border.all(color: ColorManager.line)),
          child: const Center(
            child: Text("编辑资料", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 5),

        Container(
          width: 45,
          height: 47,
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
          child: const Center(child: Icon(Icons.bookmark)),
        )
      ],
    );
  }

  _headerNickname() {
    return Text(
      "@" + _memberController.memberInfo.value.nickname,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }

  _headerAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          //头像
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: _memberController.memberInfo.value.avatar,
            height: 100.0,
            width: 100.0,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }

  _headerTitle() {
    return Container(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: ColorManager.line))),

      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.person_add_alt_1_outlined),

          Obx(() => Text(
            _memberController.memberInfo.value.username,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          )),

          IconButton(
              iconSize: 25,
              padding:const EdgeInsets.all(0.0),
              onPressed: (){
                _memberController.toggleRightMenu();
              },
              icon: const Icon(Icons.more_horiz)
          ),
        ],
      ),
    );
  }

  _countTab() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [
            Text("36", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("关注", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
          ],
        ),

        Container(color: Colors.black54, width: 1, height: 15, margin: const EdgeInsets.symmetric(horizontal: 15)),

        Column(
          children: const [
            Text("13", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("粉丝", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
          ],
        ),

        Container(
          color: Colors.black54,
          width: 1,
          height: 15,
          margin: const EdgeInsets.symmetric(horizontal: 15),
        ),

        Column(
          children: const [
            Text("143", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("点赞", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
          ],
        ),
      ],
    );
  }

  _tabs() {
    return Container(
      height: 45,
      decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.menu, color: Colors.black26),
              const SizedBox(height: 7),
              //Container(color: Colors.black, height: 2, width: 55)
              Container(color: Colors.transparent, height: 2, width: 55)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.favorite_border, color: Colors.black26),
              const SizedBox(height: 7),
              Container(color: Colors.transparent, height: 2, width: 55)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.lock_outline, color: Colors.black26),
              const SizedBox(height: 7),
              Container(color: Colors.transparent, height: 2, width: 55)
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.bookmarks_outlined, color: Colors.black26),
              const SizedBox(height: 7),
              Container(color: Colors.transparent, height: 2, width: 55)
            ],
          ),
        ],
      ),
    );
  }
}