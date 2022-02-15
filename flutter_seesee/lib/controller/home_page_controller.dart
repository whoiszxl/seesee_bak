
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/service/home_api_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///推荐页面的getx控制器
///定义obx的三种方式
// 第一种 使用 Rx{Type}
// final name = RxString('');
// final isLogged = RxBool(false);
// final count = RxInt(0);
// final balance = RxDouble(0.0);
// final items = RxList<String>([]);
// final myMap = RxMap<String, int>({});

// 第二种是使用 Rx，规定泛型 Rx<Type>。
// final name = Rx<String>('');
// final isLogged = Rx<Bool>(false);
// final count = Rx<Int>(0);
// final balance = Rx<Double>(0.0);
// final number = Rx<Num>(0)
// final items = Rx<List<String>>([]);
// final myMap = Rx<Map<String, int>>({});
// 自定义类 - 可以是任何类
// final user = Rx<User>();

// 第三种更实用、更简单、更可取的方法，只需添加 .obs 作为value的属性。
// final name = ''.obs;
// final isLogged = false.obs;
// final count = 0.obs;
// final balance = 0.0.obs;
// final number = 0.obs;
// final items = <String>[].obs;
// final myMap = <String, int>{}.obs;
// 自定义类 - 可以是任何类
// final user = User().obs;
class HomePageController extends GetxController {

  List<VideoEntity> recommendVideoList = <VideoEntity>[].obs;

  var isFirstTab = false.obs;

  int page = 1;
  final int size = 30;

  ///获取推荐视频列表
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