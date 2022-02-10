import 'package:flutter/material.dart';
import 'package:flutter_seesee/res/colors_manager.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {

  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({Key key, this.login = true, this.press,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "没有账号 ? " : "已经有账号了 ? ",
          style: const TextStyle(color: ColorManager.loginMainColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "点击注册" : "点击登录",
            style: const TextStyle(color: ColorManager.loginMainColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}