import 'package:blog_app/common/widgets/button/elevated_button.dart';
import 'package:blog_app/common/widgets/button/text_button.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/core/configs/theme/colors.dart';
import 'package:blog_app/presentation/onboard/bloc/onboard_state_cubit.dart';
import 'package:blog_app/presentation/onboard/widgets/onboard_pageview/onboard_pagecontroller.dart';
import 'package:blog_app/presentation/onboard/widgets/onboard_pageview/onboard_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/res/size_configs.dart';
import '../bloc/onboard_state.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final OnBoardPagecontroller onBoardPagecontroller = OnBoardPagecontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => OnBoardStateCubit()..checkOnBoardStatus(),
        child: BlocListener<OnBoardStateCubit, OnBoardState>(
          listener: (context, state) {
            if (state is OnBoardingComplete) {
              Navigator.pushReplacementNamed(context, AppRoutesName.authScreen);
            }
          },
          child: BlocBuilder<OnBoardStateCubit, OnBoardState>(
            builder: (context, state) {
              if (state is OnBoardingNotComplete) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.8 * AppSizeConfigs.widthMultiplier),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        /// ONBOARDING PAGEVIEW
                        FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.8,
                          child: OnboardPageview(
                            pageController: onBoardPagecontroller.pageController,
                          ),
                        ),

                        /// ONBOARDING PAGES CONTROLLER BUTTONS
                        FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.2,
                          child: Column(
                            children: [
                              /// Get Started Button
                              _getStartedButton(context),

                              SizedBox(
                                height: 5.3 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// OnBoard Skip and Next Button
                              _onBoardFooter(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _onBoardFooter(BuildContext context) {
    return BlocBuilder<OnBoardStateCubit, OnBoardState>(
      builder: (context, state) {
        if (state is OnBoardPageChangedState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Skip Button
              CustomTextButton(
                onPressed: () {
                  onBoardPagecontroller.pageController.jumpToPage(2);
                },
                label: 'Skip',
              ),

              /// Page Indicator
              Row(
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 0.9 * AppSizeConfigs.widthMultiplier),
                    width: 2.3 * AppSizeConfigs.widthMultiplier,
                    height: 1.07 * AppSizeConfigs.heightMultiplier,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.pageIndex == index
                            ? AppColor.primaryColor
                            : AppColor.secondaryColor1),
                  );
                }),
              ),

              /// Next Button
              CustomTextButton(
                onPressed: () {
                  onBoardPagecontroller.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                label: 'Next',
              )
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _getStartedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        label: 'Get Started',
        onPressed: () {
          context.read<OnBoardStateCubit>().completeOnBoarding();
        },
      ),
    );
  }
}
