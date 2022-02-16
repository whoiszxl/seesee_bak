import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/comment_page_controller.dart';
import 'package:flutter_seesee/entity/response/comment_list_response.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/utils/screen_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///视频评论组件
class VideoComment extends StatefulWidget {

  final String videoId;

  const VideoComment({Key key, this.videoId}) : super(key: key);

  @override
  _VideoCommentState createState() {
    return _VideoCommentState();
  }
}

class _VideoCommentState extends State<VideoComment> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  ScrollController scrollController = ScrollController();

  final CommentPageController _commentPageController = Get.put(CommentPageController());

  String commentText = "";

  @override
  void initState() {
    super.initState();
    _commentPageController.getCommentList(_refreshController, widget.videoId);
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(minHeight: 90, maxHeight: _size.height / 5 * 3.5),

      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _header(),
            _body(),
            _footer()
          ],
        );
      })
    );
  }


  //头部布局
  _header() {
    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 10,
            child: Text(_commentPageController.commentCount.toString() + '条评论',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
          ),
          Positioned(right: 10,
              child: InkWell(
                  onTap: (){Get.back();},
                  child: const Icon(Icons.close, size: 20, color: ColorManager.grey)
              ))
        ],
      ),
    );
  }


  _body() {
    return Expanded(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () {
          _commentPageController.refreshCommentList(_refreshController, widget.videoId);
        },
        onLoading: () {
          _commentPageController.getCommentList(_refreshController, widget.videoId);
        },
        header: const ClassicHeader(
          refreshingText: "刷新中",
          releaseText: "刷新中",
          completeText: "刷新完成",
        ),
        footer: const ClassicFooter(
          loadingText: "加载中",
          failedText: "加载失败",
          idleText: "加载中",
          canLoadingText: "加载中",
          noDataText: "没有更多评论了",
        ),
        controller: _refreshController,
        child: _listSon(_commentPageController.commentList),
      ),
    );
  }

  _listSon(List<CommentEntity> dataList) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
      controller: scrollController,
      crossAxisCount: 1,
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return _commentItem(dataList[index]);
      },

      staggeredTileBuilder: (int index) {
        return const StaggeredTile.fit(1);
      },
    );
  }

  _commentItem(CommentEntity commentEntity) {
    return Container(
      width:screenWidth(context),
      margin: const EdgeInsets.only(left: 10,right: 10,bottom: 15),
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 15, backgroundImage: NetworkImage(commentEntity.avatar)),
          const SizedBox(width: 10),
          Expanded(child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(commentEntity.nickname,style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
              const SizedBox(height: 5,),
              Text(commentEntity.commentText, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text(commentEntity.createdAt, style: TextStyle(color: Colors.grey[400],fontSize: 12)),
                  const SizedBox(width: 5),
                  const Text('回复',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.grey)),
                ],
              )
            ],
          )),
          const SizedBox(width: 10),
          Column(
            children: [
              LikeButton(
                  isLiked: commentEntity.isLiked == 1 ? true : false,
                  size: 20,
                  circleColor: const CircleColor(start: ColorManager.red,end: ColorManager.red),
                  likeBuilder: (isLike){
                    return isLike == true ? const Icon(Icons.favorite, color: ColorManager.red, size: 20) : const Icon(Icons.favorite, color: ColorManager.grey, size: 20);
                  },
                  bubblesColor:const BubblesColor(dotPrimaryColor: ColorManager.red,dotSecondaryColor: ColorManager.red,dotThirdColor: ColorManager.red,dotLastColor: ColorManager.red),
                  onTap: (bool isLiked) async {
                    if(isLiked) {
                      _commentPageController.commentDislike(commentEntity.id.toString());
                    }else {
                      _commentPageController.commentLike(commentEntity.id.toString());
                    }
                    return !isLiked;
                  }
              ),
              Text(commentEntity.likeCount.toString(), style: const TextStyle(fontSize: 12,color: ColorManager.grey)),
            ],
          ),
        ],
      ),
    );

  }

  _footer() {
    return SizedBox(
      height: 45,
      child: Column(
        children: <Widget>[

          Row(
            children: <Widget>[

              _inputField(),

              _submitButton()
            ],
          )
        ],
      ),
    );
  }

  _submitButton() {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        child: const Text("发表", style: TextStyle(color: ColorManager.white, fontSize: 12)),
        onPressed: () {
          if(commentText != "") {
            _commentPageController.commentPublish(_refreshController, widget.videoId, commentText);
            commentText = "";
          }else {
            showToast("评论不能为空");
          }
        },
        style: ElevatedButton.styleFrom(
            primary: ColorManager.main,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            textStyle: const TextStyle(color: ColorManager.main, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }

  _inputField() {
    return Expanded(child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(top: 0,bottom: 5,left: 10),
        margin: const EdgeInsets.only(left: 10,right: 6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ColorManager.line),
        child: Container(
          height: 30,
          margin: const EdgeInsets.symmetric(vertical: 0),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: const TextStyle(fontSize: 12),
            onChanged: (text) {
              commentText = text;
            },
            cursorColor: ColorManager.loginMainColor,
            decoration: const InputDecoration(hintText: "发表你的评论吧", border: InputBorder.none),
          ),
        )
    ));
  }

}