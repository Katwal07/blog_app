import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/res/size_configs.dart';
import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/configs/routes/routes_name.dart';
import '../../../../core/constants/app_string.dart';

class ChooseAuth extends StatelessWidget {
  const ChooseAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 5.5 * AppSizeConfigs.widthMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SvgPicture.asset(
              AppVectors.splashLogo,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              width: 93 * AppSizeConfigs.widthMultiplier,
              height: 4.5 * AppSizeConfigs.heightMultiplier,
            ),
          ),
          const Spacer(),
          Text(
            AppString.chooseAuthDisc,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            //height: 30
            height: 3.2 * AppSizeConfigs.heightMultiplier,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.loginScreen);
              },
              label: AppString.login,
            ),
          ),
          SizedBox(
            height: 2.1 * AppSizeConfigs.widthMultiplier,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.signupScreen);
              },
              backgroundColor: Colors.transparent,
              borderColor: Colors.white,
              label: AppString.register,
            ),
          ),
          SizedBox(
            height: 8 * AppSizeConfigs.widthMultiplier,
          ),
        ],
      ),
    );
  }
}
