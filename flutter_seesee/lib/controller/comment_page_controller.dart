
import 'package:flutter_seesee/entity/response/comment_list_response.dart';
import 'package:flutter_seesee/service/comment_api_service.dart';
import 'package:flutter_seesee/service/home_api_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///评论页面的getx控制器
class CommentPageController extends GetxController {

  int commentPage = 1;
  final int commentSize = 10;

  List<CommentEntity> commentList = <CommentEntity>[].obs;

  String currentVideoId;

  CommentApiService commentApiService = Get.find<CommentApiService>();

  var commentCount = RxInt(0);


  ///获取评论列表
  Future<bool> getCommentList(RefreshController refreshController, String videoId) async {
    if(currentVideoId != videoId) {
      currentVideoId = videoId;
      refreshCommentList(refreshController, videoId);
      return true;
    }

    var result = await Get.find<HomeApiService>().getCommentList(commentPage, commentSize, videoId);
    if(result != null) {
      commentList.addAll(result.records);
      commentCount.value = result.total;
      commentPage++;
      refreshController.loadComplete();
      return true;
    }else {
      return false;
    }
  }

  void refreshCommentList(RefreshController refreshController, String videoId) async {
    commentList.clear();
    commentPage = 1;
    await getCommentList(refreshController, videoId);
    refreshController.refreshCompleted();
  }

  ///发表评论
  void commentPublish(RefreshController refreshController, String videoId, String commentText) async {
    await commentApiService.commentPublish(videoId, commentText);
    refreshCommentList(refreshController, videoId);
  }

  ///评论点赞
  commentLike(String commentId) async {
    await commentApiService.commentLike(commentId);
  }

  ///评论取消点赞
  commentDislike(String commentId) async {
    await commentApiService.commentDislike(commentId);
  }

}