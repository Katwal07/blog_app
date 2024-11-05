import 'package:blog_app/core/configs/assets/app_images.dart';
import 'package:blog_app/core/constants/app_string.dart';
import 'package:blog_app/presentation/onboard/bloc/onboard_state_cubit.dart';
import 'package:blog_app/presentation/onboard/widgets/onboard_pageview/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardPageview extends StatelessWidget {
  const OnboardPageview({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardStateCubit(),
      child: PageView(
        controller: pageController,
        /// If panseSnaping is true(like snapping a book pages), when we scroll pages, it stops at the begining 
        /// of the next page but If it is false, it will scroll throughout the pages
        /// at one scroll 
        pageSnapping: true,
        onPageChanged: (index) {
          context.read<OnBoardStateCubit>().updatePage(index);
        },
        children: const [
          HorizontalPageView(
            image: AppImages.onboard1,
            disc: AppString.onboardTitle1,
          ),
          HorizontalPageView(
            image: AppImages.onboard2,
            disc: AppString.onboardTitle2,
          ),
          HorizontalPageView(
            image: AppImages.onboard3,
            disc: AppString.onboardTitle3,
          ),
        ],
      ),
    );
  }
}
