import 'package:flutter/material.dart';
import 'package:flutter_seesee/entity/response/profile_member_info_response.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/utils/image_util.dart';
import 'package:oktoast/oktoast.dart';

///会员中心头部页
class ProfileHeader extends StatelessWidget {

  final ProfileMemberInfoResponse memberInfo;

  const ProfileHeader({Key key, this.memberInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,

      //背景图
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/member_bg.jpg'), fit: BoxFit.fitWidth)
      ),

      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[

              //头部，包含头像，用户名，小标签
              _header(),

              _floor(context),
            ],
          )
        ],
      ),
    );
  }

  Widget _floor(context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              floorTab(memberInfo.likesCount.toString(), "获赞", () {
                showToast("获赞");
              }),
              floorTab(memberInfo.attentionCount.toString(), "关注", () {
                showToast("关注");
              }),
              floorTab(memberInfo.followerCount.toString(), "粉丝", () {
                showToast("粉丝");
              }),

            ],
          ),

          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _followButton(context)
            ],
          )


        ],
      ),
    );
  }

  _followButton(context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        child: const Text("+ 关注", style: TextStyle(color: ColorManager.white, fontSize: 12)),
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
            primary: ColorManager.red,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.5 * 0.8, vertical: 5),
            textStyle: const TextStyle(color: ColorManager.main, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }

  //头部，包含头像，用户名，小标签
  Widget _header() {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[

          //头像
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: profilePhoto(memberInfo.avatar),
          ),

          //网名和标语
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  username(memberInfo.username),
                  littleTag("100")
                ],
              ),

              const SizedBox(height: 6),
              Row(
                children: <Widget>[
                  littleTag(memberInfo.gender == 1 ? "男": (memberInfo.gender == 2 ? "女" : "未知"), bgColor: ColorManager.main, fontColor: ColorManager.white),
                  littleTag(memberInfo.province + "·" + memberInfo.city, bgColor: ColorManager.main, fontColor: ColorManager.white),
                  littleTag(memberInfo.school, bgColor: ColorManager.main, fontColor: ColorManager.white)
                ],
              )

            ],
          )
        ],
      ),
    );
  }


  Widget floorTab(String tabName, String tabValue, Function function) {
    return InkWell(
      onTap: function,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Text(tabValue, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: ColorManager.white)),
            const SizedBox(height: 5),
            Text(tabName, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, color: ColorManager.white)),

          ],
        ),
      ),
    );
  }

  Widget profilePhoto(String url) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: ColorManager.white,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: CircleAvatar(
        child: ClipOval(
          child: cachedImage(url, width: 60, height: 60, fit: BoxFit.cover)
        ),
        backgroundColor: ColorManager.white,
      ),
    );
  }


  Widget username(String username) {
    return Text(username,
      style: const TextStyle(color: ColorManager.white, fontWeight: FontWeight.bold, fontSize: 16)
    );
  }

  Widget littleTag(String text, {Color bgColor = ColorManager.red, Color fontColor = ColorManager.white}) {
    return Container(
        color: bgColor,
        padding: const EdgeInsets.only(left: 3, right: 3),
        margin: const EdgeInsets.only(left: 6),
        alignment: Alignment.centerRight,
        height: 14,
        child: Text(text, style: TextStyle(color: fontColor, fontSize: 8))
    );
  }

}