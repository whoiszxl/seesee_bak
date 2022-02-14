import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:flutter_seesee/utils/image_util.dart';
import 'package:get/get.dart';

class FollowTabVideoCard extends StatelessWidget {

  final VideoEntity videoEntity;

  const FollowTabVideoCard({Key key, this.videoEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Map<String,String> map = HashMap();
          map['videoId'] = videoEntity.id.toString();
          Get.toNamed(Routers.videoDetail, parameters: map);
        },

        child: SizedBox(
          height: 220,
          child: Card(
            margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_itemImage(context), Padding(padding: const EdgeInsets.only(top: 6, left: 6), child: _authorInfo())],
              ),
            ),
          ),
        )
    );
  }

  _authorInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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

        const Padding(
            padding: EdgeInsets.only(right: 6),
            child: Icon(Icons.favorite_border_outlined, size: 14, color: Colors.grey)
        )
      ],
    );
  }

  _itemImage(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        cachedImage(videoEntity.cover, width: size.width / 2 - 10, height: 180),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 5),
              decoration: const BoxDecoration(
                //渐变效果
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black38, Colors.transparent])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('')
                ],
              ),
            ))
      ],
    );
  }

}