import 'package:blog_app/common/widgets/button/elevated_button.dart';
import 'package:blog_app/common/widgets/container/rounded_container.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/res/size_configs.dart';
import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/colors.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),

            /// Category Text
            _selectCategoryText(context),

            const SizedBox(
              height: 100,
            ),

            /// Categories
            Expanded(flex: 4, child: _categories(context)),

            const Spacer(),

            /// Continue Button
            _continueButton(context),

            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return CustomeAppbar(
      backgroundColor: Colors.white,
      title: Center(
        child: SvgPicture.asset(
          width: 93 * AppSizeConfigs.widthMultiplier,
          height: 4.5 * AppSizeConfigs.heightMultiplier,
          AppVectors.splashLogo,
        ),
      ),
      showBackArrow: false,
    );
  }

  Widget _selectCategoryText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Please select the categories",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColor.primaryColor,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Note : You can customize your categories \nfrom feed too",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColor.secondaryColor1,
              ),
        ),
      ],
    );
  }

  Widget _continueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(onPressed: () {
        Navigator.pushReplacementNamed(context, AppRoutesName.loadingScreen);
      }, label: "Continue"),
    );
  }

  Widget _categories(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 108 / 40
          ),
      itemBuilder: (_, index) {
        return SizedBox(
          child: CustomRoundedContainer(
            height: 40,
            width: 108,
            child: Center(
              child: Text(
                "Category",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColor.primaryColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
