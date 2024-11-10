import 'package:blog_app/common/widgets/app_bar/app_bar.dart';
import 'package:blog_app/common/widgets/textfield/text_field.dart';
import 'package:blog_app/core/configs/assets/app_vectors.dart';
import 'package:blog_app/core/configs/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/res/size_configs.dart';
import '../widgets/horizontal_category.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(),
      body:  SafeArea(
          child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.5 * AppSizeConfigs.widthMultiplier),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1.1 * AppSizeConfigs.heightMultiplier,
              ),
              /// Search Bar
              const CustomTextField(
                hintText: "Search...",
                prefixIcon: Icons.search,                
              ),
              SizedBox(
                height: 2.1 * AppSizeConfigs.heightMultiplier,
              ),
          
              /// Horizontal category
              const HorizontalCategory(),
              
              SizedBox(
                height: 2.1 * AppSizeConfigs.heightMultiplier,
              ),
          
              /// All Post in GRID
              const GridViewPostCard(),
            ],
          ),
        ),
      )),
    );
  }
  

  _appBar() {
    return CustomeAppbar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(
        width: 43 * AppSizeConfigs.widthMultiplier,
        height: 3 * AppSizeConfigs.heightMultiplier,
        AppVectors.splashLogo,
        colorFilter: const ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
      ),
      showBackArrow: false,
      action: [
        Padding(
          padding: EdgeInsets.only(right: 3.5* AppSizeConfigs.widthMultiplier),
          child:  CircleAvatar(
            radius: 5.11 * AppSizeConfigs.imageSizeMultiplier,
            backgroundImage: const AssetImage('assets/images/my_photo-Photoroom.jpg'),
            backgroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
