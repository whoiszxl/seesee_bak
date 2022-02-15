import 'package:flutter_seesee/service/video_api_service.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {

  VideoApiService videoApiService = Get.find<VideoApiService>();



  ///点赞
  videoLike(String videoId) async {
    await videoApiService.videoLike(videoId);
  }

  ///取消点赞
  videoDislike(String videoId) async {
    await videoApiService.videoDislike(videoId);
  }

}