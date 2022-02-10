import 'package:flutter/material.dart';
import 'package:flutter_seesee/pages/login/widgets/text_field_container.dart';
import 'package:flutter_seesee/res/colors_manager.dart';

///圆角密码输入框组件
class RoundedPasswordField extends StatelessWidget {

  final ValueChanged<String> onChanged;
  const RoundedPasswordField({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: ColorManager.loginMainColor,
        decoration: const InputDecoration(
          hintText: "请输入密码",
          icon: Icon(Icons.lock, color: ColorManager.loginMainColor),
          suffixIcon: Icon(Icons.visibility, color: ColorManager.loginMainColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}