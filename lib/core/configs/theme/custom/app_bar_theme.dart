import 'package:blog_app/common/res/size_configs.dart';
import 'package:flutter/material.dart';

class AppAppBarTheme {
  AppAppBarTheme._();
  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: (4.2 * (AppSizeConfigs.imageSizeMultiplier)),
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
      size: (4.2 * (AppSizeConfigs.imageSizeMultiplier)),
    ),
    titleTextStyle: TextStyle(
        fontSize: (3.8 * (AppSizeConfigs.textMultiplier)),
        fontWeight: FontWeight.w600,
        color: Colors.black),
  );
}
