import 'package:flutter/material.dart';
import 'package:flutter_seesee/entity/response/video_list_response.dart';
import 'package:flutter_seesee/pages/home/widgets/video_card.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/widgets/normal_appbar.dart';
import 'package:flutter_seesee/widgets/ss_navigation_bar.dart';
import 'package:get/get.dart';

///home页面
class VideoDetailPage extends StatefulWidget {
  const VideoDetailPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VideoDetailPageState();
  }
}

class _VideoDetailPageState extends State<VideoDetailPage>{

  VideoEntity videoEntity;

  @override
  void initState() {
    Map<String, String> getParams = Get.parameters;
    videoEntity = VideoEntity.fromStrJson(getParams);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: RotatedBox(quarterTurns: 1, child: VideoCard(videoEntity: videoEntity)),
          ),

          Positioned(top: 40, left: 20, child: InkWell(
            child: const Icon(Icons.arrow_back_ios, color: ColorManager.white),
            onTap: () {
              Get.back();
            },
          ))
        ],
      )
    );
  }
}