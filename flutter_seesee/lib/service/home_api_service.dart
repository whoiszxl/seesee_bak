import 'dart:collection';

import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/http/api_urls.dart';
import 'package:flutter_seesee/http/http_manager.dart';
import 'package:get/get.dart';

///首页接口服务
class HomeApiService extends GetxService {

  ///获取推荐视频列表
  Future<VideoListResponse> getRecommendVideoList(int page, int size) async {
    Map<String, int> params = HashMap();
    params["page"] = page;
    params["size"] = size;
    var result = await HttpManager.getInstance().post(url: ApiUrls.homeRecommendVideoList, data: params);
    return VideoListResponse.fromJson(result);
  }
}