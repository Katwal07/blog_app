import 'package:blog_app/core/configs/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/res/size_configs.dart';
import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../core/configs/assets/app_vectors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Text("Loading...",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.primaryColor),),
      ),
    );
  }

  _appBar() {
    return CustomeAppbar(
      backgroundColor: Colors.white,
      title: Center(
        child: SvgPicture.asset(
          width: 18 * AppSizeConfigs.widthMultiplier,
          height: 2.5 * AppSizeConfigs.heightMultiplier,
          AppVectors.splashLogo,
        ),
      ),
      showBackArrow: false,
    );
  }
}