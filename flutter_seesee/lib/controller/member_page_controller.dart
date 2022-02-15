
import 'package:flutter_seesee/controller/main_page_controller.dart';
import 'package:flutter_seesee/entity/response/member_info_response.dart';
import 'package:flutter_seesee/entity/response/profile_member_info_response.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:flutter_seesee/router/sp_keys.dart';
import 'package:flutter_seesee/service/member_api_service.dart';
import 'package:flutter_seesee/service/video_api_service.dart';
import 'package:flutter_seesee/utils/sp_util.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///用户页面的getx控制器
class MemberPageController extends GetxController {

  MemberApiService memberApiService = Get.find<MemberApiService>();

  MainPageController mainPageController = Get.find<MainPageController>();

  final memberInfo = MemberInfoResponse().obs;


  ///登录
  Future<bool> login(String username, String password) async {
    var token = await memberApiService.login(username, password);
    if(token != null && token.isNotEmpty) {
      SPUtil.set(SPKeys.token, token);
      Get.offNamed(Routers.main);
      mainPageController.selectIndexBottomBarMainPage(3);
      return true;
    }
    return false;
  }

  ///获取会员详细信息
  Future getMemberInfo() async {
    MemberInfoResponse memberInfoResponse = await memberApiService.getMemberInfo();
    memberInfo.value = memberInfoResponse;
  }

  ///注册
  register(String username, String password) async {
    var result = await memberApiService.register(username, password);
    if(result) {
      Get.offNamed(Routers.login);
    }else {
      showToast("注册失败");
    }
  }

  List<VideoEntity> myVideoList = <VideoEntity>[].obs;

  int page = 1;
  final int size = 10;

  ///获取我的视频列表
  Future<bool> getMyVideoList(RefreshController _refreshController) async {
    var result = await Get.find<VideoApiService>().getMyVideoList(page, size);

    if(result != null) {
      page++;
      myVideoList.addAll(result.records);
      _refreshController.loadComplete();
      return true;
    }else {
      _refreshController.loadNoData();
      return false;
    }
  }

  ///刷新我的视频列表
  void refreshGetMyVideoList(RefreshController _refreshController) async {
    page = 1;
    myVideoList.clear();
    await getMyVideoList(_refreshController);
  }

  //是否展示AppBar的title
  var showTitle = false.obs;
  //是否展示右边的菜单
  var showRightMenu = false.obs;

  void setShowTitle(bool show){
    showTitle.value = show;
  }

  void toggleRightMenu(){
    showRightMenu.value = !showRightMenu.value;
  }

  final memberProfile = ProfileMemberInfoResponse().obs;

  void memberDetailById(String memberId) async {
    ProfileMemberInfoResponse profileMemberInfoResponse = await memberApiService.getMemberProfileById(memberId);
    memberProfile.value = profileMemberInfoResponse;
  }


}