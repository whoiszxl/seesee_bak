
import 'package:flutter/material.dart';
import 'package:flutter_seesee/events/close_main_drawer_event.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/application.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class MemberRightMenuWidget extends StatefulWidget {

  const MemberRightMenuWidget({Key key}) : super(key: key);

  @override
  _MemberRightMenuWidgetState createState() {
    return _MemberRightMenuWidgetState();
  }
}

class _MemberRightMenuWidgetState extends State<MemberRightMenuWidget> {

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
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width / 3 * 2,
        height: MediaQuery.of(context).size.height,
        color: ColorManager.black,
        child:Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children:_getMenuItem(),
              ),
            ),
            Positioned(
              bottom: 40,
              child: Container(
                width: MediaQuery.of(context).size.width / 3 * 2 - 40,
                height: 37,
                padding: const EdgeInsets.only(left: 36,right: 36),
                decoration: BoxDecoration(
                  color: ColorManager.grey.withAlpha(40),
                  borderRadius: BorderRadius.circular(2),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.more_horiz, size: 14, color: ColorManager.white),
                    SizedBox(width: 10,),
                    Text('更多功能',style: TextStyle(color: Colors.white,fontSize: 14),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getMenuItem() {
    return [
      UserRightMenuItemWidget(
        icon: const Icon(Icons.shopping_cart_outlined, color: ColorManager.white),
        title: '我的订单',
        onTap: (){
          showToast('功能待开发');
        },
      ),
      UserRightMenuItemWidget(
        icon: const Icon(Icons.account_balance_wallet_outlined, color: ColorManager.white),
        title: '钱包',
        onTap: (){
          showToast('功能待开发');
        },
      ),

      const SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
      ),


      const SizedBox(height: 10,),
      UserRightMenuItemWidget(
        icon: const Icon(Icons.qr_code_outlined, color: ColorManager.white),
        title: '我的二维码',
        onTap: (){
          showToast('功能待开发');
        },
      ),



      const SizedBox(height: 10,),
      UserRightMenuItemWidget(
        icon: const Icon(Icons.access_time, color: ColorManager.white),
        title: '观看历史',
        onTap: (){
          showToast('功能待开发');
        },
      ),

      const SizedBox(height: 10,),
      UserRightMenuItemWidget(
        icon: const Icon(Icons.account_balance, color: ColorManager.white),
        title: '时间管理',
        onTap: (){
          showToast('功能待开发');
        },
      ),

      const SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Divider(color: Colors.grey.withAlpha(100),height: 0.05,),
      ),


      UserRightMenuItemWidget(
        icon: const Icon(Icons.settings_outlined, color: ColorManager.white),
        title: '设置',
        onTap: (){
          Application.eventBus.fire(CloseMainDrawerEvent());
          Get.toNamed(Routers.settings);

        },
      ),
      Container(height: 100,),
    ];
  }
}

class UserRightMenuItemWidget extends StatelessWidget{
  Icon icon;
  String title;
  Function onTap;
  Alignment alignment;

  UserRightMenuItemWidget({Key key, Icon icon,String title,Function onTap,Alignment alignment}) : super(key: key){
    this.onTap = onTap;
    this.title = title;
    this.icon = icon;
    this.alignment = alignment;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.black,
      child: InkWell(
        onTap: (){
          onTap?.call();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          height: 60,
          alignment: alignment??Alignment.centerLeft,
          color: ColorManager.grey.withAlpha(40),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 10,),
              Text(title, style: const TextStyle(color: Colors.white,fontSize: 14),)
            ],
          ),
        ),
      ),
    );
  }

}