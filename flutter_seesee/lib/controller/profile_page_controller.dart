
import 'package:flutter_seesee/entity/response/member_info_response.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/service/video_api_service.dart';
import 'package:get/get.dart';

///用户详情页面的getx控制器
class ProfilePageController extends GetxController {


  final memberInfo = MemberInfoResponse().obs;

  List<VideoEntity> myVideoList = <VideoEntity>[].obs;

  int page = 1;
  final int size = 9;

  ///获取指定用户的时间线列表
  Future<bool> timeline(String memberId) async {
    var result = await Get.find<VideoApiService>().timeline(page, size, memberId);

    if(result != null) {
      myVideoList.addAll(result.records);
      page++;
      return true;
    }else {
      return false;
    }
  }

  void refreshTimeline(String memberId) async {
    page = 1;
    myVideoList.clear();
    await timeline(memberId);
  }


}