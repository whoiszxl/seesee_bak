import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/member_page_controller.dart';
import 'package:flutter_seesee/pages/login/widgets/rounded_button.dart';
import 'package:flutter_seesee/pages/login/widgets/rounded_input_field.dart';
import 'package:flutter_seesee/pages/login/widgets/rounded_password_field.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{

  MemberPageController memberPageController = Get.put(MemberPageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _body(size),
    );
  }

  _body(Size size) {
    String username = "";
    String password = "";
    return Container(
      width: double.infinity,
      height: size.height,
      color: ColorManager.main,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //登录背景
          Positioned(top: 0, left: 0, child: Image.asset("assets/images/main_top.png", width: size.width * 0.35)),
          Positioned(bottom: 0, right: 0, child: Image.asset("assets/images/login_bottom.png", width: size.width * 0.4)),

          //登录表单
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //标题
                const Text("SEESEE登录", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ColorManager.white)),
                SizedBox(height: size.height * 0.03),

                //输入框和按钮
                RoundedInputField(hintText: "请输入手机号", onChanged: (value) {
                  username = value;
                }),
                RoundedPasswordField(onChanged: (value) {
                  password = value;
                }),
                RoundedButton(text: "登录", press: () async {
                  if(username == null || username.isEmpty) {
                    showToast("用户名不能为空");
                    return;
                  }

                  if(password == null || password.isEmpty){
                    return;
                  }

                  var loginFlag = await memberPageController.login(username, password);
                  if(!loginFlag) {
                    showToast("用户名或密码错误");
                  }
                }, color: ColorManager.red,),

                SizedBox(height: size.height * 0.005),
                InkWell(
                  child: const Text("没有账号？点击注册！", style: TextStyle(fontSize: 14, color: ColorManager.grey)),
                  onTap: () {
                    Get.offNamed(Routers.register);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}