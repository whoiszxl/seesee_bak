import 'dart:collection';

import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/http/api_urls.dart';
import 'package:flutter_seesee/http/http_manager.dart';
import 'package:get/get.dart';

///视频接口服务
class VideoApiService extends GetxService {

  ///获取推荐视频列表
  Future<VideoListResponse> getRecommendVideoList(int page, int size) async {
    Map<String, dynamic> params = HashMap();
    params["page"] = page;
    params["size"] = size;
    var result = await HttpManager.getInstance().post(url: ApiUrls.homeRecommendVideoList, data: params);
    if(result == null) {
      return null;
    }
    return VideoListResponse.fromJson(result);
  }

  ///获取我的视频列表
  Future<VideoListResponse> getMyVideoList(int page, int size) async {
    Map<String, dynamic> params = HashMap();
    params["page"] = page;
    params["size"] = size;
    var result = await HttpManager.getInstance().post(url: ApiUrls.myVideoList, data: params);
    if(result == null) {
      return null;
    }
    return VideoListResponse.fromJson(result);
  }


  ///视频点赞
  videoLike(String videoId) async {
    await HttpManager.getInstance().post(url: ApiUrls.videoLike + "/" + videoId);
  }

  ///视频取消点赞
  videoDislike(String videoId) async {
    await HttpManager.getInstance().post(url: ApiUrls.videoDislike + "/" + videoId);
  }


  Future<VideoListResponse> timeline(int page, int size, String memberId) async {
    Map<String, dynamic> params = HashMap();
    params["page"] = page;
    params["size"] = size;
    params["memberId"] = memberId;
    var result = await HttpManager.getInstance().post(url: ApiUrls.timeline, data: params);
    if(result == null) {
      return null;
    }
    return VideoListResponse.fromJson(result);
  }

}