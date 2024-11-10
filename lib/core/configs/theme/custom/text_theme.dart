import 'package:blog_app/common/res/size_configs.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    // headline
    headlineLarge:  const TextStyle().copyWith(
        fontSize: 3.43 * AppSizeConfigs.textMultiplier, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium:  const TextStyle().copyWith(
        fontSize: (2.57 * AppSizeConfigs.textMultiplier), fontWeight: FontWeight.w700, color: Colors.black),
    headlineSmall:  const TextStyle().copyWith(
        fontSize: (1.93 * AppSizeConfigs.textMultiplier), fontWeight: FontWeight.w700, color: Colors.black),
    // title
    titleLarge: const TextStyle().copyWith(
        fontSize: (1.7 * AppSizeConfigs.textMultiplier), fontWeight: FontWeight.w700, color: Colors.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: (1.7 * AppSizeConfigs.textMultiplier), fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
    // body
    bodyLarge: const TextStyle().copyWith(
        fontSize: (1.5 * AppSizeConfigs.textMultiplier), fontWeight: FontWeight.w600, color: Colors.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black),
    // label
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelSmall: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
  );
}
