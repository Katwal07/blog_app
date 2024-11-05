import 'package:flutter/material.dart';

import '../../../../common/res/size_configs.dart';
import '../colors.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: AppColor.primaryColor,
    side: const BorderSide(color: AppColor.primaryColor),
    padding: EdgeInsets.symmetric(vertical: 1.5 * AppSizeConfigs.heightMultiplier),
    textStyle: TextStyle(
        fontSize: 1.5 * AppSizeConfigs.textMultiplier, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.1 * AppSizeConfigs.heightMultiplier)),
  ));
}