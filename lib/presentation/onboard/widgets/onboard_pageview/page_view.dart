import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/res/size_configs.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../onboard_disc.dart';
import '../onboard_picture.dart';

class HorizontalPageView extends StatelessWidget {
  const HorizontalPageView({
    super.key,
    required this.image,
    required this.disc,
  });

  final String image;
  final String disc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// OnBoard Logo
        _onboardLogo(),

        SizedBox(
          // height 40
          height: 4.3 * AppSizeConfigs.heightMultiplier,
        ),

        /// OnBoard Picture
        OnBoardPicture(
          image: image,
        ),

        SizedBox(
          /// height 70
          height: 7.5 * AppSizeConfigs.heightMultiplier,
        ),

        /// OnBoard Picture Discription
        OnBoardDiscription(
          title: disc,
        ),
      ],
    );
  }

  Widget _onboardLogo() {
    return SvgPicture.asset(
      width: 93 * AppSizeConfigs.widthMultiplier,
      height: 4.5 * AppSizeConfigs.heightMultiplier,
      AppVectors.splashLogo,
    );
  }
}
