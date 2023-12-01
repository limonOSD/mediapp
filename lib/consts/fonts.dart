import 'package:flutter/material.dart';
import 'package:mediapp/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class AppFonts {
  static String nunito = 'nunito', nunitoBold = 'nunito_bold';
}

class AppSizes {
  static const size12 = 12.0,
      size14 = 14.0,
      size16 = 16.0,
      size18 = 18.0,
      size20 = 20.0,
      seze22 = 22.0,
      size34 = 34.0;
}

class AppStyles {
  static normal({String? title, Color? color = Colors.black, double? size}) {
    return title!.text.size(size).color(color).make();
  }

  static bold({String? title, Color? color = Colors.black, double? size}) {
    return title!.text
        .size(size)
        .color(color)
        .fontFamily(AppFonts.nunitoBold)
        .make();
  }
}
