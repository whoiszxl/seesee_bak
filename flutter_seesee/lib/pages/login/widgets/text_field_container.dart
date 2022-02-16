import 'package:flutter/material.dart';
import 'package:flutter_seesee/res/colors_manager.dart';

class TextFieldContainer extends StatelessWidget {

  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: ColorManager.loginSecondColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}