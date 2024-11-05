import 'package:blog_app/core/configs/theme/custom/check_box_theme.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'custom/app_bar_theme.dart';
import 'custom/elevated_button_theme.dart';
import 'custom/text_field_theme.dart';
import 'custom/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Satoshi',
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme
  );

}
