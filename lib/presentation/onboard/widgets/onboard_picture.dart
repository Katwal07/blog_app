import 'package:flutter/material.dart';
import '../../../common/res/size_configs.dart';

class OnBoardPicture extends StatelessWidget {
  const OnBoardPicture({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: 93 * AppSizeConfigs.widthMultiplier,
      height: 39 * AppSizeConfigs.heightMultiplier,
      image,
    );
  }
}
