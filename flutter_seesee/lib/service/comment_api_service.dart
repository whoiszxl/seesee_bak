import 'dart:collection';

import 'package:flutter_seesee/entity/response/comment_list_response.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/http/api_urls.dart';
import 'package:flutter_seesee/http/http_manager.dart';
import 'package:get/get.dart';

///评论接口服务
class CommentApiService extends GetxService {

  ///获取评论列表
  Future<CommentListResponse> getCommentList(int page, int size, String videoId, {String commentId = "0"}) async {
    Map<String, dynamic> params = HashMap();
    params["page"] = page;
    params["size"] = size;
    params["videoId"] = videoId;
    params["commentId"] = commentId;
    var result = await HttpManager.getInstance().post(url: ApiUrls.commentList, data: params);
    return CommentListResponse.fromJson(result);
  }

  commentPublish(String videoId, String commentText, {String parentId = "0"}) async {
    Map<String, dynamic> params = HashMap();
    params["videoId"] = videoId;
    params["commentText"] = commentText;
    params["parentId"] = parentId;
    var result = await HttpManager.getInstance().post(url: ApiUrls.commentPublish, data: params);
    return true;
  }

  ///评论点赞
  commentLike(String commentId) async {
    await HttpManager.getInstance().post(url: ApiUrls.commentLike + "/" + commentId);
  }

  ///评论取消点赞
  commentDislike(String commentId) async {
    await HttpManager.getInstance().post(url: ApiUrls.commentDislike + "/" + commentId);
  }
}