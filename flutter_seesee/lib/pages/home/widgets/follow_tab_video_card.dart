import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/video_controller.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:flutter_seesee/utils/image_util.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:oktoast/oktoast.dart';

class FollowTabVideoCard extends StatelessWidget {

  final VideoEntity videoEntity;

  final VideoController _videoController = Get.put(VideoController());

  FollowTabVideoCard({Key key, this.videoEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        margin: const EdgeInsets.only(left: 4, right: 4, bottom: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //视频封面
              _itemImage(context, () {
                Get.toNamed(Routers.videoDetail, parameters: videoEntity.toStrJson());
              }),

              _descs(),
              //作者信息
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 6, bottom: 6),
                  child: _authorInfo(
                      memberInfoOnTap: () {
                        showToast("member info");
                      })
              )
            ],
          ),
        ),
      ),
    );
  }

  _descs() {
    return Padding(
      padding: const EdgeInsets.only(left: 6, top: 6),
      child: Text(videoEntity.descs, style: const TextStyle(fontSize: 11)),
    );
  }


  Future<bool> onLikeButtonTapped(bool isLiked) async{
    if(isLiked) {
      _videoController.videoDislike(videoEntity.id);
    }else {
      _videoController.videoLike(videoEntity.id);
    }
    return !isLiked;
  }

  _authorInfo({Function memberInfoOnTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: memberInfoOnTap,
          child: Row(
            children: [
              //头像
              ClipRRect(borderRadius: BorderRadius.circular(12), child: cachedImage(videoEntity.avatar, height: 24, width: 24)),

              //昵称
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(videoEntity.nickname, style: const TextStyle(fontSize: 11, color: ColorManager.black)),
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: LikeButton(
              isLiked: videoEntity.hasLiked == 1 ? true : false,
              size: 15,
              circleColor: const CircleColor(start: ColorManager.red,end: ColorManager.red),
              likeBuilder: (isLike){
                return isLike == true ? const Icon(Icons.favorite, color: ColorManager.red, size: 14) : const Icon(Icons.favorite_border_outlined, color: ColorManager.grey, size: 14);
              },
              bubblesColor:const BubblesColor(dotPrimaryColor: ColorManager.red,dotSecondaryColor: ColorManager.red,dotThirdColor: ColorManager.red,dotLastColor: ColorManager.red),
              onTap: onLikeButtonTapped
          ),
        )
      ],
    );
  }

  _itemImage(BuildContext context, Function onTap) {
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: cachedImage(videoEntity.cover, width: size.width),
          ),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 5),
                decoration: const BoxDecoration(
                  //渐变效果
                    gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black38, Colors.transparent])
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('')
                  ],
                ),
              ))
        ],
      ),
    );
  }

}