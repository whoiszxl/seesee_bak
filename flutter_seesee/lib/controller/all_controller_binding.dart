
import 'package:flutter_seesee/controller/comment_page_controller.dart';
import 'package:flutter_seesee/controller/language_controller.dart';
import 'package:flutter_seesee/controller/main_page_controller.dart';
import 'package:flutter_seesee/controller/member_page_controller.dart';
import 'package:flutter_seesee/controller/profile_page_controller.dart';
import 'package:flutter_seesee/controller/video_controller.dart';
import 'package:get/get.dart';

///所有控制器的加载器，通过Get.lazyPut进行懒注入
class AllControllerBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
    Get.lazyPut<LanguageController>(() => LanguageController());
    Get.lazyPut<MemberPageController>(() => MemberPageController());
    Get.lazyPut<VideoController>(() => VideoController());
    Get.lazyPut<CommentPageController>(() => CommentPageController());
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());


  }
}