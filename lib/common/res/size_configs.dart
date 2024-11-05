import 'package:flutter/material.dart';

class AppSizeConfigs {
  double _screenWidth = 0;
  double _screenHeight = 0;
  double _blockWidth = 0;
  double _blockHeight = 0;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double widthMultiplier;
  static late double heightMultiplier;

  static late double appBarHeight;

  void init(BoxConstraints constraints) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    appBarHeight = kToolbarHeight;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    debugPrint("Screen Width: $_screenWidth");
    debugPrint("Screen Height: $_screenHeight");
    debugPrint("Block Width: $_blockWidth");
    debugPrint("Block Height: $_blockHeight");
    debugPrint("AppBar Height: $appBarHeight");
  }
}
