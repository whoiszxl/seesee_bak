
import 'package:flutter/material.dart';
import 'package:flutter_seesee/pages/login/widgets/text_field_container.dart';
import 'package:flutter_seesee/res/colors_manager.dart';

///圆角input输入框组件
class RoundedInputField extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({Key key, this.hintText, this.icon = Icons.person, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: ColorManager.loginMainColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: ColorManager.loginMainColor),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}