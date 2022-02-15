import 'package:flutter/material.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/widgets/normal_appbar.dart';
import 'package:flutter_seesee/widgets/ss_navigation_bar.dart';

///消息页面
class MessagePage extends StatefulWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage>{

  @override
  void initState() {
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
            //appbar
            SSNavigationBar(
              height: 50,
              child: normalAppBar(context, "doremi"),
              color: ColorManager.white,
              statusStyle: StatusStyle.lightContent,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    memberInfoTile("http://zero-mall.oss-cn-shenzhen.aliyuncs.com/banner/4.png", "粉丝", "xiaozhou关注了你"),
                    memberInfoTile("http://zero-mall.oss-cn-shenzhen.aliyuncs.com/banner/3.png", "互动消息", "xyz 在评论中提到了你"),
                    memberInfoTile("http://zero-mall.oss-cn-shenzhen.aliyuncs.com/banner/2.png", "seesee小助手", "seesee元宇宙开启"),
                    memberInfoTile("http://zero-mall.oss-cn-shenzhen.aliyuncs.com/banner/5.png", "钱包通知", "SS币购买成功"),
                    memberInfoTile("http://zero-mall.oss-cn-shenzhen.aliyuncs.com/banner/1.png", "系统通知", "账号异地登录提醒"),
                  ],
                ),
              ),
            ),

          ]
      ),
    );
  }

  otherTile(list) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)
          )
      ),

      child: Column(
        children: list,
      ),
    );
  }

  ///展示用户信息和收货地址选项
  memberInfoTile(String avatarUrl, String title, String subTitle) {
    return Container(

      decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)
          )
      ),

      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(radius: 24, backgroundColor: ColorManager.white, backgroundImage: NetworkImage(avatarUrl)),
            title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Text(subTitle, style: const TextStyle(fontSize: 12, color: ColorManager.grey)),
            trailing: const Icon(Icons.navigate_next, color: ColorManager.grey),
          ),
          _border(),
        ],
      ),
    );
  }

  Widget _border() {
    return const Divider(height: 0.5, color: ColorManager.line, thickness: 1, indent: 1, endIndent: 1);
  }

}