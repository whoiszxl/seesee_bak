import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/member_page_controller.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/utils/enum_util.dart';
import 'package:flutter_seesee/widgets/normal_appbar.dart';
import 'package:flutter_seesee/widgets/normal_loading.dart';
import 'package:flutter_seesee/widgets/ss_navigation_bar.dart';
import 'package:get/get.dart';

///设置页面
class EditMemberPage extends StatefulWidget {
  const EditMemberPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<EditMemberPage>{

  final MemberPageController _memberPageController = Get.find<MemberPageController>();

  @override
  void initState() {
    super.initState();
    _memberPageController.getMemberInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if(_memberPageController.memberInfo.value == null || _memberPageController.memberInfo.value.memberId == null) {
          return normalLoading();
        }

        return Stack(
            children: [

              //appbar
              SSNavigationBar(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: InkWell(
                          child: const Icon(Icons.arrow_back,color: ColorManager.black),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ),

                      const Text("编辑个人资料", style: TextStyle(fontSize: 16, color: ColorManager.black, fontWeight: FontWeight.normal)),

                      const SizedBox(),
                    ],
                  ),
                ),
                color: ColorManager.white,
                statusStyle: StatusStyle.lightContent,
              ),


              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      memberInfoTile(),
                      Padding(padding: const EdgeInsets.only(top: 10), child: otherTile([
                        myTile("性别", EnumUtil.getGender(_memberPageController.memberInfo.value.gender), () {}),_border(),
                        myTile("生日", _memberPageController.memberInfo.value.birthday.toString(), () {}),_border(),
                        myTile("所在地", _memberPageController.memberInfo.value.country.toString() + " · " + _memberPageController.memberInfo.value.province.toString() + " · " +  _memberPageController.memberInfo.value.city.toString(), () {}),_border(),
                        myTile("学校", _memberPageController.memberInfo.value.school.toString(), () {}),_border(),
                        myTile("二维码", "点击查看二维码", () {}),_border()
                      ])),

                    ],
                  ),
                ),
              )
            ]
        );
      }),
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
  memberInfoTile() {
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
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: ColorManager.white,
              backgroundImage: NetworkImage(_memberPageController.memberInfo.value.avatar),

            ),

            title: Text(_memberPageController.memberInfo.value.username),
            subtitle: Text('账号ID: ' + _memberPageController.memberInfo.value.memberId.toString()),
            trailing: const Icon(Icons.navigate_next, color: ColorManager.grey),
          ),
          _border(),
        ],
      ),
    );
  }

  Widget _border() {
    return Container(
        color: Colors.black54,
        width: MediaQuery.of(context).size.width,
        height: 0,
    );
    return const Divider(height: 0.6, color: ColorManager.grey);
  }

  Widget myTile(String title, String subTitle, Function() func) {
    return ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subTitle),
        trailing: const Icon(Icons.navigate_next),
        onTap: func
    );
  }
}