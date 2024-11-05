import 'package:blog_app/core/configs/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../common/res/size_configs.dart';

class AppTextFieldTheme {
  AppTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColor.primaryColor,
    suffixIconColor: AppColor.primaryColor,
    hintStyle: const TextStyle().copyWith(fontSize: 1.5 * AppSizeConfigs.textMultiplier, color: AppColor.onSurfaceContainerColor,fontWeight: FontWeight.w500),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(1.1 * AppSizeConfigs.heightMultiplier),
      borderSide: const BorderSide(width: 1, color: AppColor.primaryColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(1.1 * AppSizeConfigs.heightMultiplier),
      borderSide: const BorderSide(width: 1, color: AppColor.primaryColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(1.1 * AppSizeConfigs.heightMultiplier),
      borderSide: const BorderSide(width: 1, color: AppColor.primaryColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(1.1 * AppSizeConfigs.heightMultiplier),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(1.1 * AppSizeConfigs.heightMultiplier),
      borderSide: const BorderSide(width: 2, color: AppColor.primaryColor),
    ),
  );
}
