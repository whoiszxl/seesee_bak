
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/service/home_api_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///city页面的getx控制器
class CityPageController extends GetxController {

  List<VideoEntity> recommendVideoList = <VideoEntity>[].obs;

  int page = 1;
  final int size = 10;

  ///TODO 需要获取关注用户的视频列表
  Future<bool> getRecommendVideoList(RefreshController refreshController) async {
    var result = await Get.find<HomeApiService>().getRecommendVideoList(page, size);

    if(result != null) {
      recommendVideoList.addAll(result.records);
      page++;
      refreshController.loadComplete();
      return true;
    }else {
      refreshController.loadNoData();
      return false;
    }
  }

  void refreshRecommendVideoList(RefreshController refreshController) async {
    page = 1;
    recommendVideoList.clear();
    await getRecommendVideoList(refreshController);
    refreshController.refreshCompleted();
  }

  void clearOldPageView(int threshold, RefreshController refreshController) async {
//    videoList.removeRange(0, threshold);
//    refreshController.refreshCompleted();
  }

}