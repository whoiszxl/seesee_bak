import 'package:flutter/material.dart';
import 'package:flutter_seesee/res/colors_manager.dart';

///普通appbar
normalAppBar(BuildContext context, String title, {Color titleColor = ColorManager.black}) {

  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: InkWell(
            child: const Icon(Icons.add_circle_outline,color: ColorManager.black),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),

        Text(title, style: TextStyle(fontSize: 20, color: titleColor, fontWeight: FontWeight.w600)),

        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: InkWell(
            child: const Icon(Icons.search, color: ColorManager.black),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    ),
  );


}