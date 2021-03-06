import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/video_controller.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/events/stop_play_event.dart';
import 'package:flutter_seesee/pages/home/widgets/music_icon.dart';
import 'package:flutter_seesee/pages/home/widgets/ss_video_player.dart';
import 'package:flutter_seesee/pages/home/widgets/video_comment.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/application.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

///首页video卡片
class VideoCard extends StatefulWidget {

  final VideoEntity videoEntity;

  const VideoCard({Key key, this.videoEntity}) : super(key: key);

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {

  final VideoController _videoController = Get.put(VideoController());


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: RotatedBox(
        quarterTurns: -1,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: ColorManager.black),

                //视频播放器组件
                child: SSVideoPlayer(
                  videoUrl: widget.videoEntity.videoUrl,
                ),
              ),

              //下方昵称，描述，音乐卡片
              Positioned(bottom: 0, left: 0, child: bottomTitleCard(_size)),

              //右方头像，点赞数，评论数，分享数，CD盘卡片
              Positioned(bottom: 0, right: 0, child: rightCard(_size))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    if(isLiked) {
      _videoController.videoDislike(widget.videoEntity.id);
    }else {
      _videoController.videoLike(widget.videoEntity.id);
    }
    return !isLiked;
  }

  Widget rightCard(_size) {
    return Container(
      width: _size.width * 0.2,
      height: _size.height * 0.5,
      padding: const EdgeInsets.only(left:10,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //头像
          _avatar(widget.videoEntity.avatar),
          //点赞数
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LikeButton(
                      isLiked: widget.videoEntity.hasLiked == 1 ? true : false,
                      size: 40,
                      circleColor: const CircleColor(start: ColorManager.red,end: ColorManager.red),
                      likeBuilder: (isLike){
                        return isLike == true ? const Icon(Icons.favorite, color: ColorManager.red, size: 30) : const Icon(Icons.favorite, color: ColorManager.white, size: 30);
                      },
                      bubblesColor:const BubblesColor(dotPrimaryColor: ColorManager.red,dotSecondaryColor: ColorManager.red,dotThirdColor: ColorManager.red,dotLastColor: ColorManager.red),
                      onTap: onLikeButtonTapped
                  ),
                  const SizedBox(height: 2),
                  Text(widget.videoEntity.lickCount.toString(),style: const TextStyle(color: Colors.white))
                ],
              )
          ),
          //评论数
          Padding(padding: const EdgeInsets.only(top: 7),
              child: _getIcons(Icons.comment, widget.videoEntity.commentCount.toString(), onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                  builder: (context) {
                    return VideoComment(videoId: widget.videoEntity.id);
                  }
                );
              })),
          //分享数
          Padding(padding: const EdgeInsets.only(top: 7),
              child: _getIcons(Icons.reply, widget.videoEntity.shareCount.toString(), onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
                  backgroundColor: ColorManager.black,
                  builder: (context) {
                    return const Text("hello");
                  }
                );
          })),

          //CD
          Padding(padding: const EdgeInsets.only(top: 10), child: SizedBox(
            height: 40,
            width: 40,
            child: MusicIcon(widget.videoEntity.avatar),
          ))
        ],
      )
    );
  }

  ///右侧icon item
  Widget _getIcons(IconData icon, String num, {Function onTap}) {
    return InkWell(
      child: Column(
        children: [
          Icon(icon, color: ColorManager.white, size: 30.0),
          Padding(padding: const EdgeInsets.only(top: 2), child: Text(num, style: const TextStyle(color: Colors.white, fontSize: 12)))
        ],
      ),
      onTap: onTap,
    );
  }

  Widget bottomTitleCard(_size) {
    return Container(
      width: _size.width * 0.70,
      height: _size.height * 0.25,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //昵称
          Text('@${widget.videoEntity.nickname}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),

          //视频描述
          Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 6),
            child: Text(widget.videoEntity.descs, style: const TextStyle(color: Colors.white), maxLines: 3),
          ),

          //音乐名
          Row(
            children: [
              const Icon(Icons.music_note, size: 15, color: Colors.white),
              const SizedBox(width: 3),
              Expanded(flex: 1, child: Text(widget.videoEntity.nickname + "音乐名", maxLines: 1, style: const TextStyle(color: Colors.white))),
            ],
          ),
        ],
      ),
    );
  }

  //关注头像
  Widget _avatar(img) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        children: <Widget>[
          //头像图片加载
          InkWell(
            child: Container(
              width: 50,
              height: 46,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.white),
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)
              ),
            ),

            onTap: () {
              Application.eventBus.fire(StopPlayEvent());
              Map<String,String> map = HashMap();
              map['memberId'] = widget.videoEntity.memberId;
              Get.toNamed(Routers.profile, parameters: map);
            },
          ),

          //关注“+”
          Positioned(
              bottom: 0,
              left: 17,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorManager.main),
                child: const Center(child: Icon(Icons.add, color: ColorManager.white, size: 14))))
        ],
      ),
    );
  }

}