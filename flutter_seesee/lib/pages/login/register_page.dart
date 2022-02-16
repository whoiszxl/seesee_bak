import 'package:flutter/material.dart';
import 'package:flutter_seesee/controller/member_page_controller.dart';
import 'package:flutter_seesee/pages/login/widgets/already_have_an_account_acheck.dart';
import 'package:flutter_seesee/pages/login/widgets/or_divider.dart';
import 'package:flutter_seesee/pages/login/widgets/rounded_button.dart';
import 'package:flutter_seesee/pages/login/widgets/rounded_input_field.dart';
import 'package:flutter_seesee/res/colors_manager.dart';
import 'package:flutter_seesee/router/router_manager.dart';
import 'package:get/get.dart';

///注册页面
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {

  MemberPageController memberPageController = Get.put(MemberPageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ColorManager.black,
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(top: 0, left: 0, child: Image.asset("assets/images/signup_top.png", width: size.width * 0.35)),
            Positioned(bottom: 0, left: 0, child: Image.asset("assets/images/main_bottom.png", width: size.width * 0.25)),

            _body()
          ],
        ),
      )
    );
  }

  _body() {
    String phone = "";
    String verifyCode = "";
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("SEESEE注册", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ColorManager.white)),

          SizedBox(height: size.height * 0.03),

          RoundedInputField(
            icon: Icons.phone_iphone,
            hintText: "请输入手机号码",
            onChanged: (value) {phone = value;},
          ),

          RoundedInputField(
            icon: Icons.verified_user_outlined,
            hintText: "请输入验证码",
            onChanged: (value) {verifyCode = value;},
          ),

          RoundedButton(
            text: "发送验证码",
            press: () {},
            color: ColorManager.red,
          ),

          RoundedButton(
            text: "立即注册",
            press: () {},
            color: ColorManager.red,
          ),

          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Get.offNamed(Routers.login);
            },
          ),
          const OrDivider(),

        ],
      ),
    );
  }
}
